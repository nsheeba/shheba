//
//  SRAViewController.m
//  sheeba
//
//  Created by User1 on 2014-07-25.
//  Copyright (c) 2014 cestar. All rights reserved.
//

#import "SRAViewController.h"

@interface SRAViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (nonatomic, strong) NSArray* statesUS;


@end

@implementation SRAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString* s = [[NSBundle mainBundle] pathForResource:@"states" ofType:@"txt"];
    s = [NSString stringWithContentsOfFile:s encoding:NSUTF8StringEncoding error:nil];
    self.statesUS = [s componentsSeparatedByString:@"\n"];
    // self.picker.backgroundColor = [UIColor clearColor];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    return 50;
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel* lab;
    if (view)
        lab = (UILabel*)view;
    else
        lab = [[UILabel alloc] init];
    lab.text = (self.statesUS)[row];
    lab.backgroundColor = [UIColor clearColor];
    [lab sizeToFit];
    return lab;
}

-(void)viewDidLayoutSubviews {
    NSLog(@"%f", self.picker.frame.size.height);
}



@end
