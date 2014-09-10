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

@interface RunTimerViewController ()
@property (nonatomic, strong) NSTimer *runTimer;
@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) Run *runItem;
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
}

- (NSDate *)runnedTime {
    NSDate *currentDate = [NSDate date];
    NSTimeInterval elapsedTime = [currentDate timeIntervalSinceDate:self.startTime];
    NSDate *time = [NSDate dateWithTimeIntervalSinceReferenceDate:elapsedTime];
    return time;
}

- (void)cancelTimer {
    [self.runTimer invalidate];
    self.runTimer = nil;
}

- (IBAction)endRunTouched:(UIButton *)sender {
    self.runItem.distance = @(00.0);
    self.runItem.time = [self runnedTime];
    
    [self saveData];
    [self cancelTimer];
}

- (IBAction)cancelRunTouched:(UIButton *)sender {
    [self.managedObjectContext deleteObject:self.runItem];
    [self saveData];
    
    [self cancelTimer];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
