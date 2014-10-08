//
//  RunTimerViewController.m
//  Runner
//
//  Created by David Brünner on 09.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "RunTimerViewController.h"
#import "AppDelegate.h"
#import "Run.h"
#import "RunDetailsViewController.h"
#import "Coordinate.h"

@interface RunTimerViewController () <CLLocationManagerDelegate>
@property (nonatomic, strong) NSTimer *runTimer;
@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) Run *runItem;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic) double runnedMeters;
@property (nonatomic, strong) CLLocation *lastLocation;
@end

@implementation RunTimerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    self.runItem = [NSEntityDescription insertNewObjectForEntityForName:@"Run" inManagedObjectContext:self.managedObjectContext];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 10.0;
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationItem setHidesBackButton:YES animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    self.startTime = [NSDate date];
    self.runTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/25
                                                     target:self
                                                   selector:@selector(updateTimer)
                                                   userInfo:nil
                                                    repeats:YES];
    
    self.runItem.date = self.startTime;
    [self saveData];
}

- (void)saveData {
    NSError *error = nil;
    [self.managedObjectContext save:&error];
    if (error) {
        NSLog(@" !! Error: %@", [error localizedDescription]);
    }
}

- (void)updateTimer {
    NSDate *time = [self runnedTime];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm:ss SSS";
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    [self.runTimerLabel setText:[dateFormatter stringFromDate:time]];
    
    self.distanceLabel.text = [NSString stringWithFormat:@"Strecke: %.2f km", (self.runnedMeters / 1000.0)];
    double timeInHours = [[self runnedTime] timeIntervalSinceReferenceDate] / 3600.0;
    self.averageSpeedLabel.text = [NSString stringWithFormat:@"ø %.2f km/h", (self.runnedMeters / timeInHours)];
}

- (NSDate *)runnedTime {
    NSDate *currentDate = [NSDate date];
    NSTimeInterval elapsedTime = [currentDate timeIntervalSinceDate:self.startTime];
    NSDate *time = [NSDate dateWithTimeIntervalSinceReferenceDate:elapsedTime];
    return time;
}

- (void)cancelTimer {
    [self.locationManager stopUpdatingLocation];
    [self.runTimer invalidate];
    self.runTimer = nil;
}

- (IBAction)endRunTouched:(UIButton *)sender {
    NSNumber *distance = [NSNumber numberWithDouble:(self.runnedMeters / 1000.0)];
    [self.runItem setDistance:distance];
    [self.runItem setTime:[self runnedTime]];
    [self cancelTimer];
    [self saveData];
}

- (IBAction)cancelRunTouched:(UIButton *)sender {
    [self.managedObjectContext deleteObject:self.runItem];
    [self cancelTimer];
    [self saveData];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetailSegue"]) {
        RunDetailsViewController *detailsVC = segue.destinationViewController;
        [detailsVC setRunItem:self.runItem];
    }
}


# pragma mark - CLLocation delegation

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];

    Coordinate *coordinate = [NSEntityDescription insertNewObjectForEntityForName:@"Coordinate" inManagedObjectContext:self.managedObjectContext];
    coordinate.latitude = @(location.coordinate.latitude);
    coordinate.longitude = @(location.coordinate.longitude);
    coordinate.time = [NSDate date];
    coordinate.run = self.runItem;
    
    [self saveData];
    
    if (self.lastLocation) {
        self.runnedMeters += [location distanceFromLocation:self.lastLocation];
    }
    self.lastLocation = location;
}
@end
