//
//  LYPLoad.m
//  loadingAnimation
//
//  Created by sgx_05 on 2023/3/13.
//  Copyright © 2023 吴开稳. All rights reserved.
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
         UIView *loadV = keyView.hideLoadArr.firstObject;
        [loadV removeFromSuperview];
        [keyView.hideLoadArr removeObject:loadV];
    }
    if(keyView.hideLoadArr.count>0){
        UIView *loadV = keyView.hideLoadArr.firstObject;
        if([keyView.hideLoadArr.firstObject isKindOfClass:[LYPLoadingView class]]){
            [self addLoadView:(LYPLoadingView *)loadV];
        }else{
            [self addLoadCustomView:loadV];
        }
       
    }
}

+ (void)addLoadView:(LYPLoadingView *)loadView {
    UIView *keyView = [UIApplication sharedApplication].keyWindow;
    [keyView addSubview:loadView];
    loadView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [loadView startAnimation];
    
    //可以使用这种形式开发Toast
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self hideLoading];
//    });
   
}

+ (void)addLoadCustomView:(UIView *)customView{
    UIView *keyView = [UIApplication sharedApplication].keyWindow;
    [keyView addSubview:customView];
    customView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    //可以使用这种形式开发Toast
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self hideLoading];
//    });
}

+(void)shoLoadingCustomView:(UIView *)customView {
    UIView *keyView = [UIApplication sharedApplication].keyWindow;
    if(keyView.hideLoadArr.count>0){
        [keyView.hideLoadArr addObject:customView];
    }else{
        [self addLoadCustomView:customView];
    }
}



@end
