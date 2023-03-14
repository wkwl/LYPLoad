//
//  LYPLoadingView.h
//  loadingAnimation
//
//  Created by sgx_05 on 2023/3/13.
//  Copyright © 2023 吴开稳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,LYPLoadingType) {
    LYPLoadingTypeDefautCircle = 0,
    LYPLoadingTypeAnimationLine
};


@interface LYPLoadingView : UIView

- (instancetype)initWithLoadingType:(LYPLoadingType )loadType ;

- (void)startAnimation;

@end

NS_ASSUME_NONNULL_END
