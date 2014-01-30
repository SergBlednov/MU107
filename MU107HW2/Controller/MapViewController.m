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
@property (weak, nonatomic) IBOutlet UILabel *routeTitle;

@end

@implementation MapViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIViewController *loginController = [self.storyboard instantiateViewControllerWithIdentifier:@"AuthNavigationController"];
    [self.navigationController presentViewController:loginController animated:NO completion:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(addFavotireRoutes:)
                                                 name:@"chosenRoute"
                                               object:nil];
}

- (void)addFavotireRoutes:(NSNotification *)notification {
    
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    self.routeTitle.text  = [userInfo objectForKey:@"chosenRoute"];
    NSLog(@"You have to add a favotite route! %@", self.routeTitle.text);

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
