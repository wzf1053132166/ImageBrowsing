//
//  AppDelegate.m
//  TMC
//
//  Created by tc on 2017/8/14.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<CLLocationManagerDelegate>
{
    Reachability *hostReach;
}

@property (FM_STRONG,nonatomic) CLLocationManager *locationManager;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor clearColor];
    
    
    [self locationManager];
    
    self.cacheStore = [[YTKKeyValueStore alloc] initDBWithName:@"cacheData.db"];
    
    if ([UserVO userInfo].loginStatus == YES) {
        
        
        MyAppDelegate.mainTabbarVC = [[MainTabBarViewController alloc] init];
        
        self.window.rootViewController = _mainTabbarVC;
        
    }else{
        MyAppDelegate.mainTabbarVC = [[MainTabBarViewController alloc] init];
        
        self.window.rootViewController = _mainTabbarVC;
        
    }
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    hostReach = [Reachability reachabilityWithHostName:@"www.baidu.com"] ;
    [hostReach startNotifier];
    
    [self.window makeKeyWindow];
    return YES;
}


-(void)reachabilityChanged:(NSNotification *)note

{
    
    Reachability *currReach = [note object];
    
    NSParameterAssert([currReach isKindOfClass:[Reachability class]]);
    
    //对连接改变做出响应处理动作
    
    NetworkStatus status = [currReach currentReachabilityStatus];
    
    //如果没有连接到网络就弹出提醒实况
    
    self.isReachable = YES;
    
    if(status == NotReachable)
        
    {
        if (self.isReachable == NO) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"网络连接异常" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            
            [alert show];
        }
        DLog(@"%d",self.isReachable);
        self.isReachable = NO;
        
    }
    
    if (status==ReachableViaWiFi||status==ReachableViaWWAN) {
        
        self.isReachable = YES;
        
    }
    
}

- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate =self;
        [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [_locationManager requestWhenInUseAuthorization];
        _locationManager.distanceFilter =kCLDistanceFilterNone;
        [_locationManager startUpdatingLocation];
    }
    return _locationManager;
}



- (void) dealloc{
    FM_DEALLOC();
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)networkDidReceiveMessage:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    DLog(@"123%@", userInfo);
    
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
