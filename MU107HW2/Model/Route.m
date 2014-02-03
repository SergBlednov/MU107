//
//  Route.m
//  MU107HW2
//
//  Created by Sergey Blednov on 1/17/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import "Route.h"

@implementation Route

+ (Route *)initRouteWithDictionary:(NSDictionary *)attributes {
    
    Route *route = [[Route alloc] init];
    route.title = attributes[@"route_title"];
    route.price = attributes[@"route_price"];
    return route;
}

@end
