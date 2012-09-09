//
//  BUIAlertView.m
//  BlockUI
//
//  Created by 张玺 on 12-9-9.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "BUIAlertView.h"

@implementation BUIAlertView

-(void)showWithOperation:(void (^)(NSInteger))op
{
    if(op != nil)
    {
        self.delegate = self;
        self.operation = op;
    }
    [self show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.operation(buttonIndex);
}

@end
