//
//  SwipeViewController.m
//  iOS Gestures
//
//  Created by Aaron Chong on 1/27/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *brownRectangleView;
@property (nonatomic, strong) UIView *whiteRectangleView;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
                                                                //Brown Rectangle//
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 20;
    CGFloat height = 50;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    self.brownRectangleView = [[UIView alloc] initWithFrame:frame];
    [self.view addSubview:self.brownRectangleView];
    self.brownRectangleView.backgroundColor = [UIColor brownColor];
    [self.brownRectangleView setClipsToBounds:YES];
    
                                                                //White Rectangle//
    
    self.whiteRectangleView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, width, height)]; //set x and y coordinate to 0 of the brown rectangle frame
    [self.brownRectangleView addSubview:self.whiteRectangleView];
    self.whiteRectangleView.backgroundColor = [UIColor whiteColor];
    [self.whiteRectangleView setUserInteractionEnabled:YES];
    
                                                                //Swipe Gesture//
    
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftAndRightSwiped:)];
    [self.whiteRectangleView addGestureRecognizer:leftSwipeGesture];

    //to complete setup swipe gesture, you need to setup 2 properties - number of touches to activate swipe & direction
    
    leftSwipeGesture.numberOfTouchesRequired = 1;
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftAndRightSwiped:)];
    [self.whiteRectangleView addGestureRecognizer:rightSwipeGesture];
    
    rightSwipeGesture.numberOfTouchesRequired = 1;
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    
}

- (void) leftAndRightSwiped:(UISwipeGestureRecognizer *)sender {
    
    //in the below method, new view has been made in CGRectMake
    //the X origin of new view = (sender's view x - 80)
    //animation method used is to create bounce effect
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            sender.view.frame = CGRectMake(sender.view.frame.origin.x - 85, sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);}
                         completion:^(BOOL finished) {
                             nil;}];
    } else {
        
        //new view that has been made is used again to animate it back to where it started
        //in this case x + 80, which is original position of new view
        
        [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            sender.view.frame = CGRectMake(sender.view.frame.origin.x + 85, sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);}
                         completion:^(BOOL finished) {
                             nil;}];
    }
}


@end
