//
//  BUIButton.h
//  BlockUI
//
//  Created by 张 玺 on 12-9-10.
//  Copyright (c) 2012年 me.zhangxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>



@interface UIButton (UIBlockButton)

- (void)handleControlEvent:(UIControlEvents)event withBlock:(void(^)())block;
- (void)removeHandlerForEvent:(UIControlEvents)event;


@end


