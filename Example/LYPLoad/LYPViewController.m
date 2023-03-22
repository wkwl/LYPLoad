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
#import "LYPDragView.h"

@interface LYPViewController ()

@end

@implementation LYPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    [self setDragUI];
}

- (void)setLoadUI {
    LYPCustomLoadView *customView = [[LYPCustomLoadView alloc] init];
    customView.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    UIView *gifView = [[UIView alloc] init];
    [customView addSubview:gifView];
    gifView.bounds = CGRectMake(0, 0, 160, 160);
    gifView.center = customView.center;
    gifView.backgroundColor = [UIColor redColor];
    
   
    
//    [LYPLoad showLoading];
    [LYPLoad showToast:@"我的数组"];
    [LYPLoad showToast:@"看到这些信息又不像以前的pod trunk push成功后的信息一样。这不是重点，重点是当我搜索的时候出现如下问题："];
//    [self.view showToast:@"看到这些信息又不像以前的pod trunk push成功后的信息一样。这不是重点，重点是当我搜索的时候出现如下问题："];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [LYPLoad showToast:@"看到这些信息又不像以前的pod trunk push成功后的信息一样。这不是重点，重点是当我搜索的时候出现如下问题："];
//        [LYPLoad showToast:@"我的数组"];
//        [LYPLoad showToast:@"我的数组"];
//        [LYPLoad showToast:@"我的数组"];
//        [LYPLoad showToast:@"我的数组"];
//        [LYPLoad showLoading];
////        [LYPLoad showLoading];
////        [LYPLoad showLoadingType:LYPLoadingTypeAnimationLine];
////        [LYPLoad showLoading];
////        [LYPLoad shoLoadingCustomView:customView];
//    });
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [LYPLoad hideLoading];
//        [self.view showToast:@"看到这些信息又不像以前的pod trunk push成功后的信息一样。这不是重点，重点是当我搜索的时候出现如下问题："];
//    });
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [LYPLoad hideLoading];
//    });
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [LYPLoad hideLoading];
//    });

}

- (void)setDragUI {
    LYPDragView *dragView = [[LYPDragView alloc] init];
    dragView.frame = CGRectMake(0, UIScreen.mainScreen.bounds.size.height-140, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height-100);
    dragView.topSpace = 100;
    [self.view addSubview:dragView];
    dragView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
