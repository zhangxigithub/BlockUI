//
//  BUIView.h
//  sample
//
//  Created by 张玺 on 12-9-10.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>


@interface NSObject(BNSObject)

+(void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2;
-(void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2;

@end
