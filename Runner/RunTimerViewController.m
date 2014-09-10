//
//  RunTimerViewController.m
//  Runner
//
//  Created by David Brünner on 09.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "RunTimerViewController.h"

@interface RunTimerViewController ()
@property (nonatomic, strong) NSTimer *runTimer;
@property (nonatomic, strong) NSDate *startTime;
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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    self.startTime = [NSDate date];
    self.runTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/25
                                                     target:self
                                                   selector:@selector(updateTimer)
                                                   userInfo:nil
                                                    repeats:YES];
}

- (void)updateTimer {
    NSDate *currentDate = [NSDate date];
    NSTimeInterval elapsedTime = [currentDate timeIntervalSinceDate:self.startTime];
    NSDate *time = [NSDate dateWithTimeIntervalSinceReferenceDate:elapsedTime];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm:ss SSS";
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    [self.runTimerLabel setText:[dateFormatter stringFromDate:time]];
}

- (IBAction)endRunTouched:(UIButton *)sender {
}

- (IBAction)cancelRunTouched:(UIButton *)sender {
}
@end
