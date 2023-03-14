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
    UIView *keyView = [self getKeyWindow];
   
     if(keyView.hideLoadArr.count>0){
         [keyView.hideLoadArr addObject:loadingView];
     }else{
         [self addLoadView:loadingView];
         [keyView.hideLoadArr addObject:loadingView];
     }
}



+(void)hideLoading {
    UIView *keyView = [self getKeyWindow];
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
    UIView *keyView = [self getKeyWindow];
    [keyView addSubview:loadView];
    loadView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [loadView startAnimation];
    
    //可以使用这种形式开发Toast
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self hideLoading];
//    });
   
}

+ (void)addLoadCustomView:(UIView *)customView{
    UIView *keyView = [self getKeyWindow];
    [keyView addSubview:customView];
    customView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    //可以使用这种形式开发Toast
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self hideLoading];
//    });
}

+(void)shoLoadingCustomView:(UIView *)customView {
    UIView *keyView = [self getKeyWindow];
    if(keyView.hideLoadArr.count>0){
        [keyView.hideLoadArr addObject:customView];
    }else{
        [self addLoadCustomView:customView];
    }
}


+ (UIView *)getKeyWindow {
    UIView *keyView = [UIApplication sharedApplication].keyWindow;
    if(keyView == nil){
        keyView= [[UIApplication sharedApplication].windows objectAtIndex:0];
//        keyView = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)];
//        [keyView makeKeyWindow];
    }
    return keyView;
}


/**
 * toast 处理
 */

+(void)showToast:(NSString *)msg {
    UIView *windowView = [self getKeyWindow];
    UIView *toastV = [self msgToastView:msg];
    if(windowView.lyp_toastArr.count>0){
        [windowView.lyp_toastArr addObject:toastV];
    }else{
        [self addToastView:toastV];
        [windowView.lyp_toastArr addObject:toastV];
    }
}



+(UIView *)msgToastView:(NSString *)message {
   
    UIView *toastView = [[UIView alloc] init];
    UILabel *msgLab = [[UILabel alloc] init];
    msgLab.numberOfLines = 0;
    msgLab.textAlignment = NSTextAlignmentCenter;
    msgLab.font = [UIFont systemFontOfSize:14];
    msgLab.textColor = [UIColor whiteColor];
    toastView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    [toastView addSubview:msgLab];
    toastView.layer.cornerRadius = 4;
    msgLab.text = message;
   
    [msgLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
    }];
    return toastView;
}

+(void)addToastView:(UIView *)toastView {
    toastView.alpha = 0.0;
    UIView *windowView = [self getKeyWindow];
    [windowView addSubview:toastView];
    [toastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(windowView);
        make.width.mas_lessThanOrEqualTo([UIScreen mainScreen].bounds.size.width-20);
        make.height.lessThanOrEqualTo(windowView).offset(-20);
    }];
    [UIView transitionWithView:toastView duration:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        toastView.alpha = 1.0;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self hideToast];
        });
    }];
}


+(void)hideToast {
    UIView *keyView = [self getKeyWindow];
    if(keyView.lyp_toastArr.count >0){
         UIView *toast = keyView.lyp_toastArr.firstObject;
        [toast removeFromSuperview];
        [keyView.lyp_toastArr removeObject:toast];
    }
    if(keyView.lyp_toastArr.count>0){
        UIView *toastV = keyView.lyp_toastArr.firstObject;
        [self addToastView:toastV];
    }
}
@end
