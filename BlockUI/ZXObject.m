//
//  BUIView.m
//  sample
//
//  Created by 张玺 on 12-9-10.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "ZXObject.h"
#import <objc/runtime.h>

@implementation NSObject(ZXObject)

+(void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        block1();
        dispatch_async(dispatch_get_main_queue(),^{
            block2();
        });
    }); 
}
-(void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        block1();
        dispatch_async(dispatch_get_main_queue(),^{
            block2();
        });
    });
}
//======================

const char ZXObjectStoreKey;
-(void)setZXObject:(id)obj
{
    objc_setAssociatedObject(self, &ZXObjectStoreKey, obj, OBJC_ASSOCIATION_RETAIN);
}
-(id)getZXObject
{
    return objc_getAssociatedObject(self, &ZXObjectStoreKey);
}
//=======================

const char ZXObjectDefaultEvent;
-(void)handlerDefaultEventwithBlock:(id)block
{
    objc_setAssociatedObject(self, &ZXObjectDefaultEvent, block, OBJC_ASSOCIATION_RETAIN);
}
-(id)blockForDefaultEvent
{
    return objc_getAssociatedObject(self,&ZXObjectDefaultEvent);
}

const char ZXObjectSingleObjectEvent;
-(void)receiveObject:(void(^)(id object))sendObject
{
    objc_setAssociatedObject(self,
                             &ZXObjectSingleObjectEvent,
                             sendObject,
                             OBJC_ASSOCIATION_RETAIN);
}
-(void)sendObject:(id)object
{
    void(^block)(id object) = objc_getAssociatedObject(self,&ZXObjectSingleObjectEvent);
    if(block != nil) block(object);
}
//=========================

const char ZXRowHeightKey;
-(float)zxRowHeight
{
    NSNumber *number = objc_getAssociatedObject(self,&ZXRowHeightKey);
    if(number == nil) return -1;
    return [number floatValue];
}
-(void)setZXRowHeight:(float)height
{
    objc_setAssociatedObject(self,
                             &ZXRowHeightKey,
                             [NSNumber numberWithFloat:height],
                             OBJC_ASSOCIATION_RETAIN);
}

@end
