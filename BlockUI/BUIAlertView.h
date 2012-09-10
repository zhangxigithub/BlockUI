//
//  BUIAlertView.h
//  BlockUI
//
//  Created by 张 玺 on 12-9-10.
//  Copyright (c) 2012年 me.zhangxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView(BUIAlertView)<UIAlertViewDelegate>

-(void)showWithCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler;

@end
