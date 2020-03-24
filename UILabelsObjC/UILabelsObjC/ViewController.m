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
        
        CGRect labelFrame = CGRectMake(width / 2, height / 2, 200, 21);
        
        // alloc-initWithFrame
        UILabel *myLabel = [[UILabel alloc] initWithFrame:labelFrame];
        myLabel.text = dateString;

        [self decorateUILabel:myLabel];
        [self.view addSubview:myLabel];
        
        [self addLoopLabels:4];
    }

    - (void) addLoopLabels:(int) n {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;

        for(int i = 0; i < n; i++) {
            CGFloat newY = (height / 8) + (CGFloat)(i * 21);
            CGRect labelFrame = CGRectMake(width / 2, newY, 200, 21);
            UILabel *myLabel = [[UILabel alloc] initWithFrame:labelFrame];
            myLabel.text = [NSString stringWithFormat:@"Label Number %d", i];
            [self decorateUILabel:myLabel];
            [self.view addSubview:myLabel];
        }
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
