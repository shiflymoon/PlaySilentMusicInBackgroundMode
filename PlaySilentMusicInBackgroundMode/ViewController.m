//
//  ViewController.m
//  PlaySilentMusicInBackgroundMode
//
//  Created by FJ on 2020/1/22.
//  Copyright © 2020 FJ. All rights reserved.
//

#import "ViewController.h"
#import "FJDeepSleepPreventerPlus.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __block NSTimeInterval timeToLive = 0;
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        timeToLive++;
        NSLog(@"app运行中:%@",@(timeToLive));
        if(UIApplication.sharedApplication.applicationState == UIApplicationStateBackground && UIApplication.sharedApplication.backgroundTimeRemaining < 10) {
            NSLog(@"trigger");
            [[FJDeepSleepPreventerPlus sharedInstance]stop];
            [[FJDeepSleepPreventerPlus sharedInstance]start];
        }
    }];

}


@end
