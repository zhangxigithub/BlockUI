//
//  BUIView.h
//  sample
//
//  Created by 张玺 on 12-9-10.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>


@interface NSObject(ZXObject)

//perform block1 in main thread,when finished perform block2 in background
+(void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2;
-(void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2;

//use ZXObject to deliver param(copy)
-(void)setZXObject:(id)obj;
-(id)getZXObject;

//设置一个block作为回调
-(void)handlerDefaultEventwithBlock:(id)block;
-(id)blockForDefaultEvent;

//send object
-(void)receiveObject:(void(^)(id object))sendObject;
-(void)sendObject:(id)object;


//给UITableViewCell的数据存储计算过的行高的，防止重复计算
//类似于setZXObject,不过这个意义更明确
-(float)zxRowHeight;
-(void)setZXRowHeight:(float)height;

@end
