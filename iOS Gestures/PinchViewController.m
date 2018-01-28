//
//  PinchViewController.m
//  iOS Gestures
//
//  Created by Aaron Chong on 1/27/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()

@end

@implementation PinchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 100;
    CGFloat height = 100;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    UIView *view = [[UIView alloc] initWithFrame: frame];
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
    [self.view setUserInteractionEnabled:YES];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(viewPinched:)];
    [view addGestureRecognizer:pinchGesture];
}

- (void) viewPinched:(UIPinchGestureRecognizer *) sender {
    
    CGFloat scale = sender.scale;
    sender.view.transform = CGAffineTransformMakeScale(scale, scale);
    scale = 1.0;
}

@end
