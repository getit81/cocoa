//
//  DetailViewController.h
//  Runner
//
//  Created by David Brünner on 09.09.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Run.h"
#import <MapKit/MapKit.h>

@interface RunDetailsViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) Run *runItem;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageSpeedLabel;
@property (weak, nonatomic) IBOutlet MKMapView *runOverviewMap;

@end
