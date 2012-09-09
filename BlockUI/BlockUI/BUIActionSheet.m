//
//  BUIActionSheet.m
//  BlockUI
//
//  Created by 张玺 on 12-9-9.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "BUIActionSheet.h"

@implementation BUIActionSheet

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.operation(buttonIndex);
}
-(void)config:(void(^)(NSInteger buttonIndex))op
{
    if(op == nil)
    {
        self.delegate = self;
        self.operation = op;
    }
}
-(void)showInView:(UIView *)view
    withOperation:(void(^)(NSInteger buttonIndex))op
{
    [self config:op];
    [self showInView:view];
}

-(void)showFromToolbar:(UIToolbar *)view
         withOperation:(void(^)(NSInteger buttonIndex))op
{
    [self config:op];
    [self showFromToolbar:view];
}

-(void)showFromTabBar:(UITabBar *)view
        withOperation:(void(^)(NSInteger buttonIndex))op
{
    [self config:op];
    [self showFromTabBar:view];
}

-(void)showFromRect:(CGRect)rect
             inView:(UIView *)view
           animated:(BOOL)animated
      withOperation:(void(^)(NSInteger buttonIndex))op
{
    [self config:op];
    [self showFromRect:rect inView:view animated:animated];
}

-(void)showFromBarButtonItem:(UIBarButtonItem *)item
                    animated:(BOOL)animated
               withOperation:(void(^)(NSInteger buttonIndex))op
{
    [self config:op];
    [self showFromBarButtonItem:item animated:animated];
}
@end



