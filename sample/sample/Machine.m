//
//  Machine.m
//  sample
//
//  Created by 张玺 on 12-11-24.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "Machine.h"

@implementation Machine

-(void)hello
{
    [self sendObject:@"default object"];
    [self sendObject:@"tag 3" withIdentifier:@"3"];
    
    void(^block)(NSString *,int,BOOL) = [self blockForDefaultEvent];
    if(block != nil)
        block(@"zhangxi",23,YES);
}


@end
