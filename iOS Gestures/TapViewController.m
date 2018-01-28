//
//  TapViewController.m
//  iOS Gestures
//
//  Created by Aaron Chong on 1/27/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@property (nonatomic, strong) UIView *boxView;

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    self.boxView = [[UIView alloc] initWithFrame:frame];
    [self.view addSubview:self.boxView];
    self.boxView.backgroundColor = [UIColor orangeColor];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [self.boxView addGestureRecognizer:tapGesture];
    
}

- (void) viewTapped: (UITapGestureRecognizer *)sender {
    
    if ([self.boxView.backgroundColor isEqual:[UIColor orangeColor]]) {
        
        self.boxView.backgroundColor = [UIColor yellowColor];
        
    } else {
        
        self.boxView.backgroundColor = [UIColor orangeColor];
    }
}


@end
