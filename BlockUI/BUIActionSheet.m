//
//  BUIActionSheet.m
//  BlockUI
//
//  Created by 张 玺 on 12-9-10.
//  Copyright (c) 2012年 me.zhangxi. All rights reserved.
//

#import "BUIActionSheet.h"

@implementation BUIActionSheet


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.completionHandler(buttonIndex);
    self.delegate = self.oldDelegate;
}


-(void)config:(void(^)(NSInteger buttonIndex))completionHandler
{
    if(completionHandler != nil)
    {
        self.oldDelegate = self.delegate;
        self.delegate = self;
        self.completionHandler = completionHandler;
    }
}
-(void)showInView:(UIView *)view
    withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler
{
    [self config:completionHandler];
    [self showInView:view];
}

-(void)showFromToolbar:(UIToolbar *)view
         withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler
{
    [self config:completionHandler];
    [self showFromToolbar:view];
}

-(void)showFromTabBar:(UITabBar *)view
        withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler
{
    [self config:completionHandler];
    [self showFromTabBar:view];
}

-(void)showFromRect:(CGRect)rect
             inView:(UIView *)view
           animated:(BOOL)animated
      withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler
{
    [self config:completionHandler];
    [self showFromRect:rect inView:view animated:animated];
}

-(void)showFromBarButtonItem:(UIBarButtonItem *)item
                    animated:(BOOL)animated
               withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler
{
    [self config:completionHandler];
    [self showFromBarButtonItem:item animated:animated];
}



@end
