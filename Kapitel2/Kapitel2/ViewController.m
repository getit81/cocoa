//
//  ViewController.m
//  Kapitel2
//
//  Created by David Brünner on 26.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.textView setText:@""];
	[self writeLog:NSStringFromSelector(_cmd)];
	[self setModel:[[Model alloc] initWithName:@"LoremIpsum"]];
	[self writeLog:[NSString stringWithFormat:@"Model.name: %@", [self.model name]]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.model addObserver:self forKeyPath:@"status"
                    options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                    context:@"Bla"];
    [self.model addObserver:self forKeyPath:@"countOfObjects"
                    options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self removeObserver:self forKeyPath:@"status"];
    [self removeObserver:self forKeyPath:@"countOfObjects"];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
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

- (IBAction)listModel:(id)sender {
	[self.model listDroids];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        NSLog(@"[+] Old status: %@", [change valueForKey:NSKeyValueChangeOldKey]);
        NSLog(@"[+] New status: %@", [change valueForKey:NSKeyValueChangeNewKey]);
        NSLog(@"[+] Context: %@", context);
    } else if ([keyPath isEqualToString:@"countOfObjects"]) {
        [self.countLabel setText:[NSString stringWithFormat:@"%d", [object countOfObjects]]];
    }
}

@end
