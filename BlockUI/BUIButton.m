//
//  BUIButton.m
//  BlockUI
//
//  Created by 张 玺 on 12-9-10.
//  Copyright (c) 2012年 me.zhangxi. All rights reserved.
//

#import "BUIButton.h"
@implementation UIButton (UIBlockButton)

static char UIButtonBlockKey;
static char OperationKey;


- (void)removeHandlerForEvent:(UIControlEvents)event
{
    
    NSString *methodName = [UIButton eventName:event];
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    
    if(opreations == nil)
    {
        opreations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &OperationKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    [opreations removeObjectForKey:methodName];
    [self removeTarget:self action:NSSelectorFromString(methodName) forControlEvents:event];
}

- (void)handleControlEvent:(UIControlEvents)event withBlock:(void(^)())block {
    
    NSString *methodName = [UIButton eventName:event];
    
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    
    if(opreations == nil)
    {
        opreations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &OperationKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    [opreations setObject:block forKey:methodName];
    
    [self addTarget:self action:NSSelectorFromString(methodName) forControlEvents:event];
    
}


-(void)UIControlEventTouchDown{[self callActionBlock:UIControlEventTouchDown];}
-(void)UIControlEventTouchDownRepeat{[self callActionBlock:UIControlEventTouchDownRepeat];}
-(void)UIControlEventTouchDragInside{[self callActionBlock:UIControlEventTouchDragInside];}
-(void)UIControlEventTouchDragOutside{[self callActionBlock:UIControlEventTouchDragOutside];}
-(void)UIControlEventTouchDragEnter{[self callActionBlock:UIControlEventTouchDragEnter];}
-(void)UIControlEventTouchDragExit{[self callActionBlock:UIControlEventTouchDragExit];}
-(void)UIControlEventTouchUpInside{[self callActionBlock:UIControlEventTouchUpInside];}
-(void)UIControlEventTouchUpOutside{[self callActionBlock:UIControlEventTouchUpOutside];}
-(void)UIControlEventTouchCancel{[self callActionBlock:UIControlEventTouchCancel];}




- (void)callActionBlock:(UIControlEvents)event {
    
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    
    if(opreations == nil) return;
    void(^block)() = [opreations objectForKey:[UIButton eventName:event]];
    
    if (block) block();
    
}
+(NSString *)eventName:(UIControlEvents)event
{
    switch (event) {
        case UIControlEventTouchDown:
            return @"UIControlEventTouchDown";
            break;
            
        case UIControlEventTouchDownRepeat:
            return @"UIControlEventTouchDownRepeat";
            break;
            
        case UIControlEventTouchDragInside:
            return @"UIControlEventTouchDragInside";
            break;
            
        case UIControlEventTouchDragOutside:
            return @"UIControlEventTouchDragOutside";
            break;
            
        case UIControlEventTouchDragEnter:
            return @"UIControlEventTouchDragEnter";
            break;
            
        case UIControlEventTouchDragExit:
            return @"UIControlEventTouchDragExit";
            break;
            
        case UIControlEventTouchUpInside:
            return @"UIControlEventTouchUpInside";
            break;
            
        case UIControlEventTouchUpOutside:
            return @"UIControlEventTouchUpOutside";
            break;
            
        case UIControlEventTouchCancel:
            return @"UIControlEventTouchCancel";
            break;
            
        default:
            break;
    }
    return @"";
}
+(UIControlEvents)eventWithName:(NSString *)name
{
    if([name isEqualToString:@"UIControlEventTouchDown"]) return UIControlEventTouchDown;
    if([name isEqualToString:@"UIControlEventTouchDownRepeat"]) return UIControlEventTouchDownRepeat;
    if([name isEqualToString:@"UIControlEventTouchDragInside"]) return UIControlEventTouchDragInside;
    if([name isEqualToString:@"UIControlEventTouchDragOutside"]) return UIControlEventTouchDragOutside;
    if([name isEqualToString:@"UIControlEventTouchDragEnter"]) return UIControlEventTouchDragEnter;
    if([name isEqualToString:@"UIControlEventTouchDragExit"]) return UIControlEventTouchDragExit;
    if([name isEqualToString:@"UIControlEventTouchUpInside"]) return UIControlEventTouchUpInside;
    if([name isEqualToString:@"UIControlEventTouchUpOutside"]) return UIControlEventTouchUpOutside;
    if([name isEqualToString:@"UIControlEventTouchCancel"]) return UIControlEventTouchCancel;
    if([name isEqualToString:@"UIControlEventTouchDown"]) return UIControlEventTouchDown;
    if([name isEqualToString:@"UIControlEventTouchDown"]) return UIControlEventTouchDown;
    if([name isEqualToString:@"UIControlEventTouchDown"]) return UIControlEventTouchDown;
    return UIControlEventAllEvents;
}

@end
