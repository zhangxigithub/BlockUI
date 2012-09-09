//
//  BUIControl.h
//  BlockUI
//
//  Created by 张玺 on 12-9-9.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (BUIControl)
+(Class)class;
@end

@interface BUIControl : UIControl

@property(nonatomic,copy) void (^operation_UIControlEventTouchDown)();
@property(nonatomic,copy) void (^operation_UIControlEventTouchDownRepeat)();
@property(nonatomic,copy) void (^operation_UIControlEventTouchDragInside)();
@property(nonatomic,copy) void (^operation_UIControlEventTouchDragOutside)();
@property(nonatomic,copy) void (^operation_UIControlEventTouchDragEnter)();
@property(nonatomic,copy) void (^operation_UIControlEventTouchDragExit)();
@property(nonatomic,copy) void (^operation_UIControlEventTouchUpInside)();
@property(nonatomic,copy) void (^operation_UIControlEventTouchUpOutside)();
@property(nonatomic,copy) void (^operation_UIControlEventTouchCancel)();


-(void)setOperation:(void (^)())operation withType:(UIControlEvents)type;

@end

