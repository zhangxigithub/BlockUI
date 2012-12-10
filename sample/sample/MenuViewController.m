//
//  MenuViewController.m
//  sample
//
//  Created by 张 玺 on 12-12-9.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "MenuViewController.h"
#import "BlockUIViewController.h"
#import "CommunicationViewController.h"

@implementation MenuViewController


- (IBAction)showBlockControl:(id)sender {
    
    BlockUIViewController *vc = [[BlockUIViewController alloc] initWithNibName:@"BlockUIViewController" bundle:nil];
    vc.navigationItem.title = @"UIControl";
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)showObjectCommunication:(id)sender {
    
    CommunicationViewController *vc = [[CommunicationViewController alloc] initWithNibName:@"CommunicationViewController" bundle:nil];
    vc.navigationItem.title = @"Communication";
    [self.navigationController pushViewController:vc animated:YES];
}


@end
