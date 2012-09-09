//
//  BUIAlertView.h
//  BlockUI
//
//  Created by 张玺 on 12-9-9.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BUIAlertView : UIAlertView<UIAlertViewDelegate>

@property(nonatomic,copy) void (^operation)(NSInteger buttonIndex);
-(void)showWithOperation:(void(^)(NSInteger buttonIndex))op;

@end
