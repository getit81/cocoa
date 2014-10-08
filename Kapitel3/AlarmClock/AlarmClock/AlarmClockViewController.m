//
//  AlarmClockViewController.m
//  AlarmClock
//
//  Created by David Brünner on 06.10.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "AlarmClockViewController.h"
#import "ClockView.h"

@interface AlarmClockViewController ()

@end

@implementation AlarmClockViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    for (ClockView *theView in self.view.subviews) {
        if ([theView respondsToSelector:@selector(startAnimation)]) {
            [theView startAnimation];
        }
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    for (ClockView *theView in self.view.subviews) {
        if ([theView respondsToSelector:@selector(stopAnimation)]) {
            [theView stopAnimation];
        }
    }
    [super viewWillDisappear:animated];
}

@end
