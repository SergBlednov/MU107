//
//  User.h
//  MU107HW2
//
//  Created by Sergey Blednov on 1/17/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString* username;
@property (strong, nonatomic) NSString* password;

+ (User *)userWithName:(NSString *)name andPassword:(NSString *)passsword;

- (void)login:(NSString *)name;

@end
