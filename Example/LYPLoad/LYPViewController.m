//
//  LYPViewController.m
//  LYPLoad
//
//  Created by sgx_05 on 03/13/2023.
//  Copyright (c) 2023 sgx_05. All rights reserved.
//

#import "LYPViewController.h"
#import <LYPLoad/LYPLoad.h>

@interface LYPViewController ()

@end

@implementation LYPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LYPLoad showLoading];
    });
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
