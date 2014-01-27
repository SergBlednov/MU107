//
//  ViewController.m
//  MU107HW2
//
//  Created by Sergey Blednov on 1/17/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionLogin:(UIButton *)sender {
    // Get name and password from view
    NSLog(@"Login: %@", self.txtLogin.text);
    NSLog(@"Password: %@", self.txtPassword.text);
    
    // Create the user with name (login) and password
    User *user = [User userWithName:self.txtLogin.text andPassword:self.txtPassword.text];
    
    [user login];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
