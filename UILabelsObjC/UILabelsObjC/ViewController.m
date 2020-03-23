//
//  ViewController.m
//  UILabelsObjC
//
//  Created by Field Employee on 3/23/20.
//  Copyright © 2020 Hugo Flores. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *currentDate = [NSDate date];
    NSString *dateString = [formatter stringFromDate:currentDate];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    CGRect labelFrame = CGRectMake(width / 2, height / 2, 200, 12);
    
    // alloc-initWithFrame
    UILabel *myLabel = [[UILabel alloc] initWithFrame:labelFrame];

    myLabel.text = dateString;
    
    [self.view addSubview:myLabel];
}

- (void)decorateUILabel:(UILabel*) label {
    label.numberOfLines = 2;
    label.shadowColor = [UIColor darkGrayColor];
    label.shadowOffset = CGSizeMake(1.0,1.0);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor redColor];
    label.font = [UIFont fontWithName:@"Verdana" size:18.0];
}


@end
