//
//  InputViewController.h
//  sample
//
//  Created by 张 玺 on 12-12-9.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXObject.h"

@interface InputViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *textFeild;

- (IBAction)confirm:(id)sender;


@end
