BlockUI
=======

UIControl use block
去TMD delegate ,去TMD的 target,just use block.

##Support##
* UIAlertView
* UIActionSheet
* UIControl

##Author##
张玺
<http://zhangxi.me>

##Require##
* ARC
* iOS 4.0 or later

##Use##
![screen](http://2.zxapi.sinaapp.com/BlockUIscreen.png)

```
#import "BlockUI.h"


//UIAlertView
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"title"
                                                  message:@"message"
                                                 delegate:self
                                        cancelButtonTitle:@"ok"
                                        otherButtonTitles:nil];
[alert showWithCompletionHandler:^(NSInteger buttonIndex) {
        NSLog(@"button:%d",buttonIndex);
}];


//UIActionSheet
UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:@"title"
                                                      delegate:nil
                                             cancelButtonTitle:@"ok"
                                        destructiveButtonTitle:nil
                                             otherButtonTitles:@"1",@"2", nil];
[action showInView:self.view withCompletionHandler:^(NSInteger buttonIndex) {
    NSLog(@"button:%d",buttonIndex);
}];



//UIButton .etc
UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
[button handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender){
    NSLog(@"in");
}];
[button handleControlEvent:UIControlEventTouchUpOutside withBlock:^(id sender){
    NSLog(@"out");
}];
[button removeHandlerForEvent:UIControlEventTouchUpInside];

UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"1",@"2",@"3"]];

[seg handleControlEvent:UIControlEventValueChanged withBlock:^(id sender) {
    NSLog(@"%@",sender);
}];
```