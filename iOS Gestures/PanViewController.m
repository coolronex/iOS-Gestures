//
//  PanViewController.m
//  iOS Gestures
//
//  Created by Aaron Chong on 1/27/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController


- (IBAction)redViewPanned:(UIPanGestureRecognizer *)sender {
    
    //method 1:
    
//    CGPoint locationInView = [sender locationInView: self.view];
//    sender.view.center = locationInView;
    
    //method 2: - using translation in view (this method can get you the velocity if you need it)
    
    CGPoint translationInView = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
    sender.view.center = newCenter;
    [sender setTranslation:CGPointZero inView:self.view];
}

@end
