//
//  MapViewController.m
//  MU107HW2
//
//  Created by Sergey Blednov on 1/23/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import "MapViewController.h"
#import "LoginViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIViewController *loginController = [self.storyboard instantiateViewControllerWithIdentifier:@"AuthNavigationController"];
    
    [self.navigationController presentViewController:loginController animated:NO completion:nil];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionLongTouch:(UILongPressGestureRecognizer *)sender {
    // Message after touching
    NSLog(@"Was touched!!");
}

@end
