//
//  AppDelegate.m
//  sample
//
//  Created by 张玺 on 12-9-10.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "AppDelegate.h"
#import "Machine.h"
#import "BlockUI.h"
#import "MenuViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    
    MenuViewController *viewController = [[MenuViewController alloc] init];
    
    viewController.navigationItem.title = @"BlockUI";
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [self.window makeKeyAndVisible];
    
    

    
    Machine *machine = [[Machine alloc] init];

    [machine receiveObject:^(id object) {
        NSLog(@"~~~~~~~~%@",object);
    }];
    [machine receiveObject:^(id object) {
        NSLog(@"3:%@",object);
    } withIdentifier:@"3"];
    

    
    [machine handlerDefaultEventWithBlock:^(NSString *name,int age,BOOL sex){
        
        NSLog(@"\n name:%@ \n age:%d \n sex:%@",name,age,sex?@"male":@"female");
    }];
    
    
    
    
    [machine hello];
    

    
    //***************
    //***************

    [NSObject perform:^{
        NSLog(@"start");
        [NSThread sleepForTimeInterval:1];
        NSLog(@"end");
    } withCompletionHandler:^{
        NSLog(@"finished");
    }];
    
    return YES;
}


@end
