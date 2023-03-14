//
//  UIView+LYPToast.m
//  loadingAnimation
//
//  Created by sgx_05 on 2022/6/21.
//  Copyright © 2022 吴开稳 All rights reserved.
//

#import "UIView+LYPToast.h"
#import <objc/runtime.h>

static NSString *totastQueueKey = @"totastQueue";

static NSString *timerKey = @"timerKey";

static NSString *hideToastKey = @"hideToastKey";

static NSString *hideLoadKey = @"hideLoadArr";

static NSString *toastKey = @"lyp_toastArr";

@interface UIView ()

//存放totastVIew 的数组
@property (nonatomic, strong) NSMutableArray *totastQueue;

//待隐藏的Toast数组
@property (nonatomic, strong) NSMutableArray *hideToastArr;

@end

@implementation UIView (LYPToast)

#pragma mark - runtime添加属性

- (void)setTotastQueue:(NSMutableArray *)totastQueue {
    objc_setAssociatedObject(self, &totastQueueKey, totastQueue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)totastQueue {
    NSMutableArray *arr = objc_getAssociatedObject(self, &totastQueueKey);
    if (arr == nil) {
        arr = [NSMutableArray array];
        objc_setAssociatedObject(self, &totastQueueKey, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return arr;
}

- (void)setHideToastArr:(NSMutableArray *)hideToastArr {
    objc_setAssociatedObject(self, &hideToastKey, hideToastArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSMutableArray *)hideToastArr {
    NSMutableArray *arr = objc_getAssociatedObject(self, &hideToastKey);
    if (arr == nil) {
        arr = [NSMutableArray array];
        objc_setAssociatedObject(self, &hideToastKey, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return arr;
}

- (void)setLyp_toastArr:(NSMutableArray *)lyp_toastArr {
    objc_setAssociatedObject(self, &toastKey, lyp_toastArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)lyp_toastArr {
    NSMutableArray *list = objc_getAssociatedObject(self, &toastKey);
    if(list == nil){
        list = [NSMutableArray array];
        objc_setAssociatedObject(self, &toastKey, list, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return list;
}

#pragma mark -
- (void)showToast:(NSString *)msg {
    UIView *toastV = [self toastView:msg];
    [self showToastContent:toastV];
}


//显示视图
- (void)showToastContent:(UIView *)toast  {
   
    if (toast == nil) {
        return;
    }
    if (self.hideToastArr.count > 0) {
        //当视图隐藏队数组数量大于0时，先将视图添加到视图显示数组中，反之直接显示
        [self.totastQueue addObject:toast];
    }else{
        [self showToaskView:toast];
    }
}


- (void)showToaskView:(UIView *)toastView {
    if (toastView == nil) {
        return;
    }
    toastView.alpha = 0.0;

    [self.hideToastArr addObject:toastView];
 
    [self addSubview:toastView];
    [toastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.mas_lessThanOrEqualTo([UIScreen mainScreen].bounds.size.width-20);
        make.height.lessThanOrEqualTo(self).offset(-20);
    }];
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
        toastView.alpha = 1.0;
    } completion:^(BOOL finished) {
        
        //动态给视图类添加属性
        NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(totastTimer_finish:) userInfo:toastView repeats:NO];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        //动态给view添加定时器属性
        objc_setAssociatedObject(self, &timerKey, timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }];
}


//显示视图及其内容
- (UIView *)toastView:(NSString *)msg {
    UIView *toastView = [[UIView alloc] init];
    toastView.backgroundColor = [UIColor blackColor];
    UILabel *nameLab = [[UILabel alloc] init];
    nameLab.text = msg;
    nameLab.textColor = [UIColor whiteColor];
    nameLab.numberOfLines = 0;
    [toastView addSubview:nameLab];
    [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
    }];
    toastView.layer.cornerRadius = 4;
    nameLab.font = [UIFont systemFontOfSize:14];
    nameLab.textAlignment = NSTextAlignmentCenter;
  
    return toastView;
}


#pragma mark -action
- (void)totastTimer_finish:(NSTimer *)timer {
    [self hideToastView:(UIView *)timer.userInfo];
}

- (void)hideToast:(UIView *)toast {
    
}

//隐藏视图
- (void)hideToastView:(UIView *)toast {
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState)
                     animations:^{
        toast.alpha = 0.0;
    } completion:^(BOOL finished) {
        [toast removeFromSuperview];
        [self.hideToastArr removeObject:toast];
        if (self.totastQueue.count > 0) {
            UIView *nextToast = [self.totastQueue firstObject];
            [self.totastQueue removeObjectAtIndex:0];
            [self showToaskView:nextToast];
        }
    }];
}


- (void)setHideLoadArr:(NSMutableArray *)hideLoadArr {
    objc_setAssociatedObject(self, &hideLoadKey, hideLoadArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)hideLoadArr {
    NSMutableArray *arr = objc_getAssociatedObject(self, &hideLoadKey);
    if(arr == nil){
        arr = [NSMutableArray array];
        objc_setAssociatedObject(self, &hideLoadKey, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return arr;
}
@end
