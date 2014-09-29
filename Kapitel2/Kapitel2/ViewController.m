//
//  ViewController.m
//  Kapitel2
//
//  Created by David Brünner on 26.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.textView setText:@""];
    [self writeLog:NSStringFromSelector(_cmd)];
    [self setModel:[[Model alloc] initWithName:@"LoremIpsum"]];
    [self writeLog:[NSString stringWithFormat:@"Model.name: %@", [self.model name]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)writeLog:(NSString *)inLogString {
    NSLog(@"[+] %@.%@", self, NSStringFromSelector(_cmd));
    NSDateFormatter *theFormatter = [[NSDateFormatter alloc] init];
    
    [theFormatter setDateFormat:@"HH:mm:ss.SSS"];
    [self.textView setText:[NSString stringWithFormat:@"%@\n%@ [+] %@",
                            [self.textView text],
                            [theFormatter stringFromDate:[NSDate date]],
                            inLogString]];
}

- (IBAction)updateCountOfDroids:(UIStepper *)sender {
    int theValue = [sender value];
    
    [self.model updateDroids:theValue];
    [self writeLog:[NSString stringWithFormat:@"countOfObjects = %d", [self.model countOfObjects]]];
}

@end
