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
#import <JASidePanelController.h>

#import "MBProgressHUD.h"

@interface RoutesViewController ()

@property (strong, nonatomic) NSArray *routes;


@end

@implementation RoutesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor = MENU_BACKGROUND_COLOR;
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.routes.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", cell.subviews);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Route *route = (Route *)self.routes[indexPath.row];
    
    static NSString *CellIdentifier = @"Cell";
    static NSString *FavCellIdentifier = @"FavCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:route.isFavorited?FavCellIdentifier:CellIdentifier forIndexPath:indexPath];
    

    cell.textLabel.text = route.title;
    cell.detailTextLabel.text = route.price;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Route *route = (Route *)self.routes[indexPath.row];
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setValue:route forKey:@"chosenRoute"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"chosenRouteByClick" object:self userInfo:userInfo];
    [self.sidePanelController showCenterPanelAnimated:YES];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *stub = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    stub.backgroundColor = MENU_BACKGROUND_COLOR;
    return stub;
}

@end
