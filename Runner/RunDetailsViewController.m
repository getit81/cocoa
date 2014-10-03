//
//  DetailViewController.m
//  Runner
//
//  Created by David Brünner on 09.09.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "RunDetailsViewController.h"
#import "Coordinate.h"

@interface RunDetailsViewController ()
@property (nonatomic, strong) MKPolyline *routePolyLine;
@property (nonatomic, strong) MKPolylineView *routePolyLineView;
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
        [timeDateFormatter setDateFormat:@"HH:mm:ss"];
        
        [timeDateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
        
        [self.dateLabel setText:[runDateFormatter stringFromDate:self.runItem.date]];
        [self.timeLabel setText:[timeDateFormatter stringFromDate:self.runItem.time]];
        NSLog(@"Log in %@:%@, Distanz: %.2f", self, NSStringFromSelector(_cmd), self.runItem.distance.floatValue);
        [self.distanceLabel setText:[[NSString alloc] initWithFormat:@"Strecke: %.2f km" locale:[NSLocale currentLocale], self.runItem.distance.floatValue]];
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        [calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
        NSDateComponents *components = [calendar components:NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:self.runItem.time];
        float runnedHours = (float)[components hour] + ((float)[components minute] / 60.0) + ((float)[components second] / 3600);
        [self.averageSpeedLabel setText:[NSString stringWithFormat:@"ø %.2f km/h", self.runItem.distance.floatValue / runnedHours]];
    
        // Draw map polys
        NSOrderedSet *coordinates = self.runItem.coordinates;
        CLLocationCoordinate2D polyCoordinates[10000];
        for (int i = 0; i < [coordinates count]; i++) {
            Coordinate *coordinate = coordinates[i];
            polyCoordinates[i] = CLLocationCoordinate2DMake(coordinate.latitude.doubleValue, coordinate.longitude.doubleValue);
        }
        self.routePolyLine = [MKPolyline polylineWithCoordinates:polyCoordinates count:[coordinates count]];
        [self.runOverviewMap addOverlay:self.routePolyLine];
        [self.runOverviewMap setVisibleMapRect:[self.routePolyLine boundingMapRect]];
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


# pragma mark - MapView delegation

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
    if (overlay != self.routePolyLine) {
        return nil;
    }
    if (self.routePolyLineView) {
        return self.routePolyLineView;
    }
    self.routePolyLineView = [[MKPolylineView alloc] initWithPolyline:self.routePolyLine];
    self.routePolyLineView.fillColor = [UIColor redColor];
    self.routePolyLineView.strokeColor = [UIColor redColor];
    self.routePolyLineView.lineWidth = 5.0;
    
    return self.routePolyLineView;
}

@end
