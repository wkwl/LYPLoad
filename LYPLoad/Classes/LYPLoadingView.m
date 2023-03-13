//
//  LYPLoadingView.m
//  loadingAnimation
//
//  Created by sgx_05 on 2023/3/13.
//  Copyright © 2023 张永强. All rights reserved.
//

#import "LYPLoadingView.h"

@implementation LYPLoadingView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
     
//        [self creatLineAnimation];
    }
    return self;
}

- (instancetype)initWithLoadingType:(LYPLoadingType )loadType {
    self = [super initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    if(self){
        if(loadType == LYPLoadingTypeAnimationLine){
            [self creatLineAnimation];
        }else{
            [self creatCircleAnimation];
        }
    }
    return self;
}


- (void)creatCircleAnimation {
    //创建一个relicatorLayer对象
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.bounds = CGRectMake(0, 0, 100, 100);
    replicatorLayer.cornerRadius = 10.0;
    replicatorLayer.masksToBounds = YES;
    replicatorLayer.position = self.center;
//    replicatorLayer.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.2].CGColor;
    replicatorLayer.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8].CGColor;
    [self.layer addSublayer:replicatorLayer];
    //添加一个点
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 10, 10);
    layer.position = CGPointMake(50, 20);
//    layer.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.6].CGColor;
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    layer.cornerRadius = 5;
    [replicatorLayer addSublayer:layer];
    //设置relicatorLayer对象子视图的个数 及其位置
    CGFloat count = 10;
    replicatorLayer.instanceCount = count;
    CGFloat angle = 2 * M_PI / count;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    //添加动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 1.0;
    animation.fromValue = @1;
    animation.toValue = @0.1;
    animation.repeatCount = MAXFLOAT;
    [layer addAnimation:animation forKey:nil];
    //设置延迟值
    replicatorLayer.instanceDelay = 1.0 / count;
    //防止动画太卡初始化dotLayer的transform
    layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1);
}


- (void)creatLineAnimation {
    //创建一个relicatorLayer对象
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.bounds = CGRectMake(0, 0, 100, 100);
    replicatorLayer.cornerRadius = 10.0;
    replicatorLayer.masksToBounds = YES;
    replicatorLayer.position = self.center;
    replicatorLayer.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8].CGColor;
    [self.layer addSublayer:replicatorLayer];
    CGFloat lineH = 60;
    CGFloat lineX = 20;
    CGFloat lineW = 5;
    //添加一条直线
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, lineW, lineH);
    layer.position = CGPointMake(lineX, replicatorLayer.frame.size.height - 30);
//    layer.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.6].CGColor;
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicatorLayer addSublayer:layer];
    //设置relicatorLayer对象子视图的个数及其位置
    CGFloat count = 6;
    replicatorLayer.instanceCount = count;
    CGFloat lineInter = 10;
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(lineInter, 0, 0);
    //添加动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.duration = 0.5;
    animation.toValue = @(lineH *0.4);//结束值
    animation.autoreverses = YES;//动画结束时是否执行逆动画
    animation.repeatCount = MAXFLOAT;
    [layer addAnimation:animation forKey:nil];
    //设置延迟值
    replicatorLayer.instanceDelay = 0.5 / count;
    //防止动画太卡初始化Layer的transform
    layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
    
}

@end
