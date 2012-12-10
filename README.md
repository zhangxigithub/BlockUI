BlockUI
========

BlockUI主要有两个功能:

* 扩展UIControl,UIActionSheet,UIAlertView。使用block最为回调，简化调用流程，是代码在逻辑上更通顺。
* 扩展NSObject,方便对象间通信。


##Author##
张玺

微博:<http://weibo.com/zxrex>

Home:<http://zhangxi.me>

##Require##
* ARC
* iOS 4.0 or later

##Use##
![screen](http://2.zxapi.sinaapp.com/BlockUIscreen.png)

```
//in first object
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

//in second object
    //send object use default identifier
    [self sendObject:_textFeild.text];
    
    //send object use custom identifier
    [self sendObject:_textFeild.text
      withIdentifier:@"inputFinish"];
    
    
    void(^block)(NSString *,NSString *) = [self blockForEventWithIdentifier:@"custom block"];;
    
    block(@"I'm the first value",@"I'm the second value");
    
    
```


```
//first of all
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