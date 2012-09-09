//
//  BUIControl.m
//  BlockUI
//
//  Created by 张玺 on 12-9-9.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "BUIControl.h"

@implementation UIControl(BUIControl)

+(Class)class {
    return NSClassFromString(@"BUIControl");
}

@end

@implementation BUIControl

-(void)setOperation:(void (^)())operation withType:(UIControlEvents)type
{
    switch (type) {
        case UIControlEventTouchDown:
            self.operation_UIControlEventTouchDown = operation;
            break;
        case UIControlEventTouchDownRepeat:
            self.operation_UIControlEventTouchDownRepeat = operation;
            break;
        case UIControlEventTouchDragInside:
            self.operation_UIControlEventTouchDragInside = operation;
            break;
        case UIControlEventTouchDragOutside:
            self.operation_UIControlEventTouchDragOutside = operation;
            break;
        case UIControlEventTouchDragEnter:
            self.operation_UIControlEventTouchDragEnter = operation;
            break;
        case UIControlEventTouchDragExit:
            self.operation_UIControlEventTouchDragExit = operation;
            break;
        case UIControlEventTouchUpInside:
            self.operation_UIControlEventTouchUpInside = operation;
            break;
        case UIControlEventTouchUpOutside:
            self.operation_UIControlEventTouchUpOutside = operation;
            break;
        case UIControlEventTouchCancel:
            self.operation_UIControlEventTouchCancel = operation;
            break;
            
        default:
            break;
    }
}
@end
