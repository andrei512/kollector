//
//  AppDelegate.m
//  One Picture Everyday
//
//  Created by Andrei on 8/21/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self performBlock:^{
        nam3 = @"Hello";
        PO(conteXt)
        PO(this)
        PO(param)
        PO(params)
        
    }];
    
    PO(resu1t)
//
//    [@1337 performBlock:^{
//        PO(conteXt)
//        PO(this)
//        PO(param)
//        PO(params)
//    }];
//    
//    PO(resu1t)
//    
//    [@123 performBlock:^{
//        PO(conteXt)
//        PO(this)
//        PO(param)
//        PO(params)
//    }
//                  with:@[@"ana", @"are", @"mere"]];
//    
//    NSArray *a = @[@111, @222, @333];
//    
//    NSArray *x = kollect(a, ^{
//        as(NSNumber)
//        ret(@(object.intValue * 2))
//    });
//    
//    PO(x)
// 
    [self performBlockwithParams:@[]
                      andContext:self.bindings
                    onContextKey:@".*Label"
                           block:^{
                               
                           }];

    ranGe(1, 10).do(^{
        PO(this)
    });
    
    ThisBlock rangeBlock = ^{
        for (int i = a; i <= b; ++i) {
            yield(@(i))
        }
    }
    
    
    APViewController *viewController = [MainViewController viewController];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    self.viewController = viewController;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
