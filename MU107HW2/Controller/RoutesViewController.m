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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
