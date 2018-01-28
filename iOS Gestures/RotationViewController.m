//
//  RotationViewController.m
//  iOS Gestures
//
//  Created by Aaron Chong on 1/27/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@property (weak, nonatomic) IBOutlet UIView *redBoxView;

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)rotationGesture:(UIRotationGestureRecognizer *)sender {
    
    sender.view.transform = CGAffineTransformRotate(sender.view.transform, sender.rotation);
    sender.rotation = 0; //if you dont set it to 0, it will not be able to rotate again after release...
    
}



@end
