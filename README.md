BlockUI
=======

UIControl use block
去TMD delegate ,去TMD的 target,just use block.

##support##
* UIAlertView
* UIActionSheet
* UIControl

##use##

```
#import "BUIAlertView.h"
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"title"
                                                  message:@"message"
                                                 delegate:self
                                        cancelButtonTitle:@"ok"
                                        otherButtonTitles:nil];
[alert showWithCompletionHandler:^(NSInteger buttonIndex) {
        NSLog(@"button:%d",buttonIndex);
}];
```
```
#import "BUIActionSheet.h"
UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:@"title"
                                                      delegate:nil
                                             cancelButtonTitle:@"ok"
                                        destructiveButtonTitle:nil
                                             otherButtonTitles:@"1",@"2", nil];
[action showInView:self.view withCompletionHandler:^(NSInteger buttonIndex) {
    NSLog(@"button:%d",buttonIndex);
}];
```
```
#import "BUIControl.h"
UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
[button handleControlEvent:UIControlEventTouchUpInside withBlock:^{
    NSLog(@"in");
}];
[button handleControlEvent:UIControlEventTouchUpOutside withBlock:^{
    NSLog(@"out");
}];
[button removeHandlerForEvent:UIControlEventTouchUpInside];
```