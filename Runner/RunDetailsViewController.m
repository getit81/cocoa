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
    // Update the user interface for the detail item.

    if (self.runItem) {
        self.detailDescriptionLabel.text = [self.runItem.date description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
