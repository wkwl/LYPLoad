//
//  LYPViewController.m
//  LYPLoad
//
//  Created by sgx_05 on 03/13/2023.
//  Copyright (c) 2023 sgx_05. All rights reserved.
//

#import "LYPViewController.h"
//#import <LYPLoad/LYPLoad.h>
#import <LYPLoad.h>
#import "LYPCustomLoadView.h"

@interface LYPViewController ()

@end

@implementation LYPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    LYPCustomLoadView *customView = [[LYPCustomLoadView alloc] init];
    customView.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    UIView *gifView = [[UIView alloc] init];
    [customView addSubview:gifView];
    gifView.bounds = CGRectMake(0, 0, 160, 160);
    gifView.center = customView.center;
    gifView.backgroundColor = [UIColor redColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LYPLoad showLoading];
        [LYPLoad showLoadingType:LYPLoadingTypeAnimationLine];
        [LYPLoad shoLoadingCustomView:customView];
        [LYPLoad showLoading];
      
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LYPLoad hideLoading];
        [self.view showToast:@"看到这些信息又不像以前的pod trunk push成功后的信息一样。这不是重点，重点是当我搜索的时候出现如下问题："];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LYPLoad hideLoading];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LYPLoad hideLoading];
    });

   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
