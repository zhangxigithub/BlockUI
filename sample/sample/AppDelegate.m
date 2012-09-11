//
//  AppDelegate.m
//  sample
//
//  Created by 张玺 on 12-9-10.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "AppDelegate.h"

#import "BlockUI.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor grayColor];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    
    
    
    
    //***************
    //***************
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [viewController.view addSubview:button];
    button.frame = CGRectMake(50, 50, 100, 44);
    [button setTitle:@"alert view" forState:UIControlStateNormal];
    
    [button handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
       
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"alert"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"ok"
                                              otherButtonTitles:@"other",nil];
        [alert showWithCompletionHandler:^(NSInteger buttonIndex) {
            NSLog(@"%d",buttonIndex);
        }];
        
    }];
    
    
    //***************
    //***************
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [viewController.view addSubview:button2];
    button2.frame = CGRectMake(170, 50, 100, 44);
    [button2 setTitle:@"action sheet" forState:UIControlStateNormal];
    
    [button2 handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil
                                                           delegate:nil
                                                  cancelButtonTitle:@"cancel"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:@"item1",@"item2",nil];
        [sheet showInView:viewController.view withCompletionHandler:^(NSInteger buttonIndex) {
            NSLog(@"action:%d",buttonIndex);
        }];
        
        
    }];
    
    
    //***************
    //***************
    UISwitch *swithControl = [[UISwitch alloc] initWithFrame:CGRectMake(50, 10, 0, 0)];
    [viewController.view addSubview:swithControl];
    [swithControl handleControlEvent:UIControlEventValueChanged withBlock:^(id sender) {
        UISwitch *s = sender;
        NSLog(@"value:%@",s.isOn?@"on":@"off");
    }];
    
    
    //***************
    //***************
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 110, 220, 0)];
    [viewController.view addSubview:slider];
    [slider handleControlEvent:UIControlEventValueChanged withBlock:^(id sender) {
        UISlider *slider = sender;
        NSLog(@"slider:%f",slider.value);
    }];
    
    
    
    //***************
    //***************
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"item1",@"item2",@"item3"]];
    segment.frame = CGRectMake(50, 150, 220, 44);
    [viewController.view addSubview:segment];
    [segment handleControlEvent:UIControlEventValueChanged withBlock:^(id sender) {
        UISegmentedControl *segment = sender;
        NSLog(@"segment change to %d",segment.selectedSegmentIndex);
    }];
    
    
    
    
    //***************
    //***************
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 244, 0, 0)];
    [viewController.view addSubview:datePicker];
    [datePicker handleControlEvent:UIControlEventValueChanged withBlock:^(id sender) {
        UIDatePicker *picker = sender;
        NSLog(@"date:%@",picker.date);
    }];
    
    
    
    return YES;
}


@end
