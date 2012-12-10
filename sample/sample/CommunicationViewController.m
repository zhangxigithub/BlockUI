//
//  CommunicationViewController.m
//  sample
//
//  Created by 张 玺 on 12-12-9.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "CommunicationViewController.h"
#import "InputViewController.h"

@implementation CommunicationViewController



- (IBAction)showInput:(id)sender {
    
    InputViewController *input = [[InputViewController alloc] initWithNibName:@"InputViewController" bundle:nil];
    input.navigationItem.title = @"input";
    
    
    //receive object with default identifier
    [input receiveObject:^(id object) {
        _label.text = object;
        NSLog(@"[default]receive : %@",object);
    }];
    
    //receive object with custom identifier
    [input receiveObject:^(id object) {
         NSLog(@"[inputFinish]receive : %@",object);
    } withIdentifier:@"inputFinish"];

    
    [input handlerEventWithBlock:^(NSString *value1,NSString *value2){
    
        NSLog(@"%@",value1);
        NSLog(@"%@",value2);
    }
                  withIdentifier:@"custom block"];
    
    
    
    [self.navigationController pushViewController:input animated:YES];

}
- (void)viewDidUnload {
    [self setLabel:nil];
    [super viewDidUnload];
}
@end
