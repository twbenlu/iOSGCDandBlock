//
//  ViewController.h
//  5_InvokeMainThread
//
//  Created by benlu on 2/21/15.
//  Copyright (c) 2015 benlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIProgressView *myProgress;

-(void)dosomething;


@end

