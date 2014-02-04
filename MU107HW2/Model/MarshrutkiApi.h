//
//  MarshrutkiApi.h
//  MU107HW2
//
//  Created by Sergey Blednov on 1/30/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <CoreData/CoreData.h>
#import "Route.h"

@interface MarshrutkiApi : NSObject

@property NSManagedObjectModel *objectModel;
@property NSManagedObjectContext *context;
@property NSPersistentStoreCoordinator *persistentStore;

+ (MarshrutkiApi *)sharedClient;
- (void)getRoutes:(void (^)(NSArray *, NSError *))block params:(NSDictionary *)params;

@end
