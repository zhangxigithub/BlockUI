//
//  BUIActionSheet.h
//  BlockUI
//
//  Created by 张玺 on 12-9-9.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BUIActionSheet : UIActionSheet<UIActionSheetDelegate>

@property(nonatomic,copy) void (^operation)(NSInteger buttonIndex);

-(void)showInView:(UIView *)view
    withOperation:(void(^)(NSInteger buttonIndex))op;

-(void)showFromToolbar:(UIToolbar *)view
         withOperation:(void(^)(NSInteger buttonIndex))op;

-(void)showFromTabBar:(UITabBar *)view
        withOperation:(void(^)(NSInteger buttonIndex))op;

-(void)showFromRect:(CGRect)rect
             inView:(UIView *)view
           animated:(BOOL)animated
      withOperation:(void(^)(NSInteger buttonIndex))op;

-(void)showFromBarButtonItem:(UIBarButtonItem *)item
                    animated:(BOOL)animated
               withOperation:(void(^)(NSInteger buttonIndex))op;


@end
