//
//  AppDelegate.m
//  test-domino
//
//  Created by Vitalik Danchenko on 03.10.16.
//  Copyright © 2016 Talkable. All rights reserved.
//

#import "AppDelegate.h"
#import <TalkableSDK/Talkable.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIViewController* firstVC = [[UIViewController alloc] init];
    [firstVC.view setBackgroundColor:[UIColor blueColor]];
    
    UIViewController* secondVC = [[UIViewController alloc] init];
    [secondVC.view setBackgroundColor:[UIColor yellowColor]];
    
    UIViewController* thirdVC = [[UIViewController alloc] init];
    [thirdVC.view setBackgroundColor:[UIColor greenColor]];
    
    UINavigationController* firstNVC = [[UINavigationController alloc] initWithRootViewController:firstVC];
    
    UITabBarController* tabBarViewController = [[UITabBarController alloc] init];
    tabBarViewController.viewControllers = @[firstNVC, secondVC, thirdVC];
    
    self.window.rootViewController = tabBarViewController;
    
    UIViewController* modalVC = [[UIViewController alloc] init];
    [modalVC.view setBackgroundColor:[UIColor redColor]];
    
    [self.window makeKeyAndVisible];
    
    UINavigationController* modalNVC = [[UINavigationController alloc] initWithRootViewController:modalVC];
    modalNVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    [tabBarViewController presentViewController:modalNVC animated:YES completion:nil];
    
    [[Talkable manager] setDebug:YES];
    [[Talkable manager] setApiKey:@"8L6Kcf9DEIGQQHLDf8i" andSiteSlug:@"talkable-ios-demo"];
    
    return YES;
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

- (BOOL)application:(UIApplication *)application openURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation {
    
    [[Talkable manager] handleOpenURL:url];
    
    return YES;
}


@end
