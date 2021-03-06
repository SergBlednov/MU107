//
//  AppDelegate.h
//  MU107HW2
//
//  Created by Sergey Blednov on 1/17/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error;

@end
