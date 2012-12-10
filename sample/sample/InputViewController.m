//
//  InputViewController.m
//  sample
//
//  Created by 张 玺 on 12-12-9.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "InputViewController.h"

@implementation InputViewController



- (void)viewDidUnload {
    [self setTextFeild:nil];
    [super viewDidUnload];
}

- (IBAction)confirm:(id)sender {
    
    //send object use default identifier
    [self sendObject:_textFeild.text];
    
    //send object use custom identifier
    [self sendObject:_textFeild.text
      withIdentifier:@"inputFinish"];
    
    
    void(^block)(NSString *,NSString *) = [self blockForEventWithIdentifier:@"custom block"];;
    
    block(@"I'm the first value",@"I'm the second value");
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
