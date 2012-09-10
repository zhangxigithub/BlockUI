//
//  BUIAlertView.m
//  BlockUI
//
//  Created by 张 玺 on 12-9-10.
//  Copyright (c) 2012年 me.zhangxi. All rights reserved.
//

#import "BUIAlertView.h"

@implementation BUIAlertView


-(void)showWithCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler
{
    if(completionHandler != nil)
    {
        self.oldDelegate = self.delegate;
        self.delegate = self;
        self.completionHandler = completionHandler;
    }
    [self show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.completionHandler(buttonIndex);
    self.delegate = self.oldDelegate;
}
@end
