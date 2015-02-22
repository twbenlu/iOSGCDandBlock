//
//  ViewController.m
//  5_InvokeMainThread
//
//  Created by benlu on 2/21/15.
//  Copyright (c) 2015 benlu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

     self.myProgress.progress = 0;
 
    //取得主執行緒
    //dispatch_queue_t mainQueue = dispatch_get_main_queue();
    //取得Concurrent執行緒
    //dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    //自訂執行緒
    dispatch_queue_t myQueue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);

//第一種寫法
//    dispatch_async(myQueue, ^{
//        int i;
//        for (i=0; i<= 10; i+=1) {
//            [NSThread sleepForTimeInterval:1.0f];
//            dispatch_async(mainQueue, ^{
//                [self.myProgress setProgress:i*0.1];
//            });
//            NSLog(@"%d",i);
//        }
//    });
    
    //第二種寫法
    dispatch_async(myQueue,^{
        [self dosomething];
    });

    NSLog(@"主執行緒結束");
}




-(void)dosomething{
    
    //取得主執行緒
    
    int i;
    for (i=0; i<= 10; i+=1) {
        [NSThread sleepForTimeInterval:1.0f];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myProgress setProgress:i*0.1];
        });
        NSLog(@"%d",i);
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
