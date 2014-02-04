//
//  MapViewController.m
//  MU107HW2
//
//  Created by Sergey Blednov on 1/23/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import "MapViewController.h"
#import "LoginViewController.h"
#import "Route.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet UILabel *routeTitle;
@property (nonatomic) Route *currentRoute;

@end

@implementation MapViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIViewController *loginController = [self.storyboard instantiateViewControllerWithIdentifier:@"AuthNavigationController"];
    [self.navigationController presentViewController:loginController animated:NO completion:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(shownRoutes:)
                                                 name:@"chosenRouteByClick"
                                               object:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"★" style:UIBarButtonItemStyleBordered target:self action:@selector(selectedRoute)];
}

- (void)shownRoutes:(NSNotification *)notification {
    
    self.currentRoute = [[notification userInfo] objectForKey:@"chosenRoute"];
    self.title = self.currentRoute.title;
    self.navigationItem.rightBarButtonItem.title = self.currentRoute.isFavorited?@"☆":@"★";
    
    NSLog(@"You have chosen: %@", self.currentRoute.title);

}

- (void)selectedRoute {
    
    self.currentRoute.isFavorited = !self.currentRoute.isFavorited;    
    self.navigationItem.rightBarButtonItem.title = @"☆";
    self.navigationItem.rightBarButtonItem.title = self.currentRoute.isFavorited?@"☆":@"★";
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedRoute" object:nil];
    NSLog(@"Your favorite route: %@", self.currentRoute.title);
    
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
