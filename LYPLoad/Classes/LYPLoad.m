//
//  LYPLoad.m
//  loadingAnimation
//
//  Created by sgx_05 on 2023/3/13.
//  Copyright © 2023 张永强. All rights reserved.
//

#import "LYPLoad.h"


@interface LYPLoad ()

@end


@implementation LYPLoad

+(void)showLoading {
    [self showLoadingType:LYPLoadingTypeDefautCircle];
}

+(void)showLoadingType:(LYPLoadingType )loadType {
    LYPLoadingView *loadingView = [[LYPLoadingView alloc] initWithLoadingType:loadType];
     UIView *keyView = [UIApplication sharedApplication].keyWindow;
     if(keyView.hideLoadArr.count>0){
         [keyView.hideLoadArr addObject:loadingView];
     }else{
         [self addLoadView:loadingView];
         [keyView.hideLoadArr addObject:loadingView];
     }
}


+(void)hideLoading {
    UIView *keyView = [UIApplication sharedApplication].keyWindow;
    if(keyView.hideLoadArr.count >0){
        LYPLoadingView *loadV = (LYPLoadingView *)keyView.hideLoadArr.firstObject;
        [loadV removeFromSuperview];
        [keyView.hideLoadArr removeObject:loadV];
    }
    if(keyView.hideLoadArr.count>0){
        LYPLoadingView *loadV = keyView.hideLoadArr.firstObject;
        [self addLoadView:loadV];
    }
}

+ (void)addLoadView:(LYPLoadingView *)loadView {
    UIView *keyView = [UIApplication sharedApplication].keyWindow;
    [keyView addSubview:loadView];
    loadView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [loadView startAnimation];
   
}



@end
