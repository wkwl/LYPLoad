//
//  UIView+LYPToast.h
//  loadingAnimation
//
//  Created by sgx_05 on 2022/6/21.
//  Copyright © 2022 吴开稳 All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LYPToast)

@property (nonatomic,strong) NSMutableArray *hideLoadArr;

- (void)showToast:(NSString *)msg;



@end

NS_ASSUME_NONNULL_END
