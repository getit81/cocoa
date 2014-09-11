//
//  DetailViewController.m
//  Runner
//
//  Created by David Brünner on 09.09.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "RunDetailsViewController.h"

@interface RunDetailsViewController ()
- (void)configureView;
@end

@implementation RunDetailsViewController

#pragma mark - Managing the detail item

- (void)setRunItem:(id)newDetailItem
{
    if (_runItem != newDetailItem) {
        _runItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    if (self.runItem) {
        NSDateFormatter *runDateFormatter = [[NSDateFormatter alloc] init];
        [runDateFormatter setDateFormat:@"EEEE, dd.MM.Y"];
        
        NSDateFormatter *timeDateFormatter = [[NSDateFormatter alloc] init];
        [timeDateFormatter setDateFormat:@"HH:mm:ss SSS"];
        
        [timeDateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
        
        [self.dateLabel setText:[runDateFormatter stringFromDate:self.runItem.date]];
        [self.timeLabel setText:[timeDateFormatter stringFromDate:self.runItem.time]];
        [self.distanceLabel setText:[NSString stringWithFormat:@"Strecke: %.2f km", self.runItem.distance.floatValue]];
        [self.averageSpeedLabel setText:@"ø 3 km/h"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.navigationController.viewControllers.count < 3) {
        return;
    }
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Meine Läufe" style:UIBarButtonItemStylePlain target:self action:@selector(backToOverviewTouched)];
    [self.navigationItem setLeftBarButtonItem:backButton];
}

- (void)backToOverviewTouched {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
