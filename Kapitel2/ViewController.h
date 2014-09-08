//
//  ViewController.h
//  Kapitel2
//
//  Created by David Brünner on 07.09.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "Log.h"

@interface ViewController : UIViewController<LogDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong) Model *model;
- (IBAction)updateCountOfDroids:(UIStepper *)sender;
@end
