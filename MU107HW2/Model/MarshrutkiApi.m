//
//  MarshrutkiApi.m
//  MU107HW2
//
//  Created by Sergey Blednov on 1/30/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import "MarshrutkiApi.h"

@implementation MarshrutkiApi

+ (MarshrutkiApi *)sharedClient {
    static MarshrutkiApi *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[MarshrutkiApi alloc] init];
    });
    
    return _sharedClient;
}

- (void)getRoutes:(void (^)(NSArray *, NSError *))block params:(NSDictionary *)params {
    

    
    void (^mySuccessBlock)(AFHTTPRequestOperation *operation, id responseObject) = ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *rawRoutes = (NSArray *)responseObject;
        NSMutableArray *routes = [[NSMutableArray alloc] init];
        
        for (NSDictionary *attributes in rawRoutes) {
            [routes addObject:[Route initRouteWithDictionary:attributes]];
        }
        if (block != nil) {
            block(routes, nil);
        }
    };
    
    void (^myFailureBlock)(AFHTTPRequestOperation *operation, NSError *error) = ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
        if (block != nil) {
            block(nil, error);
        }
    };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:ROUTESURL parameters:nil success:mySuccessBlock failure:myFailureBlock];
}

@end
