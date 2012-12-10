//
//  AppDelegate.m
//  sample
//
//  Created by 张玺 on 12-9-10.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "AppDelegate.h"


#import "BlockUI.h"
#import "MenuViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    
    MenuViewController *menu = [[MenuViewController alloc] init];
    menu.navigationItem.title = @"BlockUI";
    
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:menu];
    [self.window makeKeyAndVisible];

    
    
    
    //***************
    [NSObject perform:^{
        NSLog(@"start");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"end");
    } withCompletionHandler:^{
        NSLog(@"finished");
    }];
    
    
    return YES;
}


@end
