//
//  AppDelegate.h
//  TMC
//
//  Created by tc on 2017/8/14.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YTKKeyValueStore;
@class MainTabBarViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) MainTabBarViewController *mainTabbarVC;
@property (nonatomic, strong) YTKKeyValueStore *cacheStore;
@property BOOL isReachable;

@end

