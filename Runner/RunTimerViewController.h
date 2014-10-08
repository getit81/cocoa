//
//  RunTimerViewController.h
//  Runner
//
//  Created by David Brünner on 09.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RunTimerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *runTimerLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageSpeedLabel;

- (IBAction)endRunTouched:(UIButton *)sender;
- (IBAction)cancelRunTouched:(UIButton *)sender;
@end
