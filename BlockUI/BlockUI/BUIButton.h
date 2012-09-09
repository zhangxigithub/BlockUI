//
//  BUIButton.h
//  BlockUI
//
//  Created by 张玺 on 12-9-9.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BUIControl.h"

@interface BUIButton : UIButton

-(void)setOperation:(void (^)())operation withType:(UIControlEvents)type;
@end
