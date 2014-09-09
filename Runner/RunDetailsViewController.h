//
//  DetailViewController.h
//  Runner
//
//  Created by David Brünner on 09.09.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Run.h"

@interface RunDetailsViewController : UIViewController

@property (strong, nonatomic) Run *runItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
