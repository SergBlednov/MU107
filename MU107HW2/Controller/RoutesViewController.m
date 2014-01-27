//
//  RoutesViewController.m
//  MU107HW2
//
//  Created by Sergey Blednov on 1/24/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import "RoutesViewController.h"
#import "Route.h"

#import <AFNetworking.h>
#import "MBProgressHUD.h"

@interface RoutesViewController ()

@property (strong, nonatomic) NSMutableArray * routes;

@end

@implementation RoutesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 
    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    
    [manager GET:@"http://marshrutki.com.ua/mu/routes.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSArray *rawRoutes = (NSArray *)responseObject;
        self.routes = [[NSMutableArray alloc] init];
        
        for (NSDictionary *attributes in rawRoutes) {
            [self.routes addObject:[Route initRouteWithDictionary:attributes]];
        }
        
        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.routes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Route *route = (Route *)self.routes[indexPath.row];
    cell.textLabel.text = route.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    [[self navigaionController] pushViewController:LoginViewController animated:YES];
}


@end
