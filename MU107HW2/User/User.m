//
//  User.m
//  MU107HW2
//
//  Created by Sergey Blednov on 1/17/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import "User.h"

@implementation User

+ (User *)userWithName:(NSString *)name andPassword:(NSString *)password {
    
    User *user = [[User alloc] init];
    
    user.username = name;
    user.password = password;
    
    return user;
}

- (void)login:(NSString *)name {
    NSLog(@"User %@ tried to login!", name);
}
@end
