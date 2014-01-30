//
//  RoutesViewController.m
//  MU107HW2
//
//  Created by Sergey Blednov on 1/24/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import "RoutesViewController.h"
#import "Route.h"
#import "MarshrutkiApi.h"

#import "MBProgressHUD.h"

@interface RoutesViewController ()

@property (strong, nonatomic) NSArray *routes;

@end

@implementation RoutesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[MarshrutkiApi sharedClient] getRoutes:^(NSArray *routes, NSError *error) {
        self.routes = routes;
        [self.tableView reloadData];
    } params:nil];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0) {
        return 3;
    } else {
        return self.routes.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Route *route = (Route *)self.routes[indexPath.row];
    cell.textLabel.text = route.title;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Route *route = (Route *)self.routes[indexPath.row];
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setValue:route forKey:@"chosenRoute"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"chosenRoute" object:self userInfo:userInfo];
    
}

@end
