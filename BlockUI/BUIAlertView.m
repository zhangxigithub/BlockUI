//
//  BUIAlertView.m
//  BlockUI
//
//  Created by 张 玺 on 12-9-10.
//  Copyright (c) 2012年 me.zhangxi. All rights reserved.
//

#import "BUIAlertView.h"
#import <objc/runtime.h>

@implementation UIAlertView(BUIAlertView)

const char oldDelegateKey;
const char completionHandlerKey;

-(void)showWithCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler
{
    if(completionHandler != nil)
    {
        id oldDelegate = objc_getAssociatedObject(self, &oldDelegateKey);
        if(oldDelegate == nil)
        {
            objc_setAssociatedObject(self, &oldDelegateKey, oldDelegate, OBJC_ASSOCIATION_ASSIGN);
        }
        
        oldDelegate = self.delegate;
        self.delegate = self;
        objc_setAssociatedObject(self, &completionHandlerKey, completionHandler, OBJC_ASSOCIATION_COPY);
    }
    [self show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    void (^theCompletionHandler)(NSInteger buttonIndex) = objc_getAssociatedObject(self, &completionHandlerKey);
    
    if(theCompletionHandler == nil)
        return;

    theCompletionHandler(buttonIndex);
    self.delegate = objc_getAssociatedObject(self, &oldDelegateKey);
}
@end
