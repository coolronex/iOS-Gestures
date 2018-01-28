//
//  EdgePanViewController.m
//  iOS Gestures
//
//  Created by Aaron Chong on 1/28/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "EdgePanViewController.h"

@interface EdgePanViewController () <UIGestureRecognizerDelegate>

@property (nonatomic) UIView *panView;
@property (nonatomic) UIPanGestureRecognizer *panGesture;
@property (nonatomic) UIScreenEdgePanGestureRecognizer *edgeGesture;
@property (nonatomic) CGRect originalFrame;
@property (nonatomic) CGRect pannedFrame;

@end

@implementation EdgePanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 500;
    CGFloat height = 300;
    
    self.originalFrame = CGRectMake(self.view.frame.size.width - 20, CGRectGetMidY(self.view.bounds) - width/4, width, height);
    self.pannedFrame = CGRectMake(100, CGRectGetMidY(self.view.bounds) - width/4, width, height);
    
    self.panView = [[UIView alloc] initWithFrame:self.originalFrame];
    self.panView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.panView];

    //set edges direction after alloc init
    self.edgeGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector (edgePanGesture:)];
    [self.edgeGesture setEdges:UIRectEdgeRight];
    [self.panView addGestureRecognizer:self.edgeGesture];
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.panView addGestureRecognizer:self.panGesture];
    [self.panGesture setEnabled:NO]; //set to NO or else it wont recognize edge gesture...
    
}

- (void)edgePanGesture:(UIPanGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateChanged){
        
        CGPoint translationInView = [sender translationInView:self.view];
        CGPoint oldCenter = sender.view.center;
        CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y);
        
        sender.view.center = newCenter;
        [sender setTranslation:CGPointZero inView:self.view];
    }
    
    if (sender.state == UIGestureRecognizerStateEnded){
        NSLog(@"Edge gesture recognized!");
        
        // check if it goes beyond threshold. if it does then set the view to the slide-open view, if it doesn't return to original view
        if (self.panView.frame.origin.x <= self.originalFrame.origin.x - 150) {
            
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.panView.frame = self.pannedFrame; }
                             completion:^(BOOL finished) {
                                 nil;}];
            
            [self.panGesture setEnabled:YES]; //turn on pan gesture after view is opened
            
        } else {
        
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.panView.frame = self.originalFrame;}
                             completion:^(BOOL finished) {
                                 nil;}];
        }
    }
    
}


- (void)panGesture:(UIPanGestureRecognizer *)sender {
    NSLog(@"pan gesture recognized!");
    
    if (sender.state == UIGestureRecognizerStateChanged){
        
        CGPoint translationInView = [sender translationInView:self.view];
        CGPoint oldCenter = sender.view.center;
        CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y);
        
        sender.view.center = newCenter;
        [sender setTranslation:CGPointZero inView:self.view];
    }
    
    if (sender.state == UIGestureRecognizerStateEnded){
        
        if (self.panView.frame.origin.x >= 100){
            
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.panView.frame = self.originalFrame; }
                             completion:^(BOOL finished) {
                                 nil;}];
            
            [self.panGesture setEnabled:NO]; //turn pan gesture back off so that it will detect edge gesture instead of pan gesture
            
        } else {
            
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.panView.frame = self.pannedFrame; }
                             completion:^(BOOL finished) {
                                 nil;}];
        }
    }
}



@end
