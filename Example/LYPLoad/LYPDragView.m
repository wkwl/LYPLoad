//
//  LYPDragView.m
//  LYPLoad_Example
//
//  Created by sgx_05 on 2023/3/20.
//  Copyright © 2023 sgx_05. All rights reserved.
//

#import "LYPDragView.h"

@interface LYPDragView ()<UIGestureRecognizerDelegate>
@property (nonatomic,assign) float bottomH;//下滑后距离顶部的距离
@property (nonatomic,assign) CGFloat dragY;
@end

@implementation LYPDragView
CGFloat myFrameY;
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        [self setUI];
    }
    return self;
}

- (void)setDragY:(CGFloat)dragY {
    self.frame = CGRectMake(self.frame.origin.x, dragY, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)dragY {
    return self.frame.origin.y;
}
- (void)setUI {

//    self.backgroundColor = [UIColor redColor];
//    self.bottomH = self.dragY;
    UIPanGestureRecognizer * panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    panGestureRecognizer.delegate = self;
    [self addGestureRecognizer:panGestureRecognizer];
//    [self addSubview:self.scrollV];
//    self.scrollV.bounces = NO;
//    self.scrollV.userInteractionEnabled = NO;

}



- (void)drawRect:(CGRect)rect {
    self.bottomH = self.dragY;
}

#pragma mark - 滑动


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (void)panAction:(UIPanGestureRecognizer *)pan
{
    // 获取视图偏移量
    CGPoint point = [pan translationInView:self];

    // self.dragY是视图距离顶部的距离
  
   self.dragY += point.y;
    if (self.dragY< self.topSpace) {
        self.dragY = self.topSpace;
    }
    
    // self.bottomH是视图在底部时距离顶部的距离
    if (self.dragY> self.bottomH) {
       self.dragY = self.bottomH;
    }

    // 在滑动手势结束时判断滑动视图距离顶部的距离是否超过了屏幕的一半，如果超过了一半就往下滑到底部
    // 如果小于一半就往上滑到顶部
    if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled) {
        
        // 滑动速度
        CGPoint velocity = [pan velocityInView:self];
        CGFloat speed = 350;
        if (velocity.y < -speed) {
            [self goTop];
            [pan setTranslation:CGPointMake(0, 0) inView:self];
            return;
        }else if (velocity.y > speed){
            [self goBack];
            [pan setTranslation:CGPointMake(0, 0) inView:self];
            return;
        }
        
        if (self.dragY > UIScreen.mainScreen.bounds.size.height/2) {
            [self goBack];
        }else{
            [self goTop];
        }
    }
    
    [pan setTranslation:CGPointMake(0, 0) inView:self];
}

- (void)goTop {
    [UIView animateWithDuration:0.5 animations:^{
        self.dragY=  self.topSpace;
     
    }completion:^(BOOL finished) {
    }];
}

- (void)goBack {
    [UIView animateWithDuration:0.5 animations:^{
         self.dragY = self.bottomH;
    }completion:^(BOOL finished) {
    }];
}


@end
