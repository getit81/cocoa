//
//  ViewController.h
//  Kapitel2
//
//  Created by David Brünner on 26.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong) Model *model;

- (IBAction)updateCountOfDroids:(UIStepper *)sender;

@end
