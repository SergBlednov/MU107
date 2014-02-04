//
//  Bus.h
//  MU107HW2
//
//  Created by Sergey Blednov on 2/4/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Route;

@interface Bus : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic) float longitude;
@property (nonatomic) float latitude;
@property (nonatomic, retain) Route *route;

@end
