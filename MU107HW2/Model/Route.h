//
//  Route.h
//  MU107HW2
//
//  Created by Sergey Blednov on 2/4/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Route : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * price;
@property (nonatomic) BOOL isFavorited;
@property (nonatomic, retain) NSSet *buses;
@end

@interface Route (CoreDataGeneratedAccessors)

- (void)addBusesObject:(NSManagedObject *)value;
- (void)removeBusesObject:(NSManagedObject *)value;
- (void)addBuses:(NSSet *)values;
- (void)removeBuses:(NSSet *)values;

@end
