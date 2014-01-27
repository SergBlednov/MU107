//
//  Route.h
//  MU107HW2
//
//  Created by Sergey Blednov on 1/17/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject

@property (strong, nonatomic) NSString *title;

+ (Route *)initRouteWithDictionary:(NSDictionary *)attributes;

@end
