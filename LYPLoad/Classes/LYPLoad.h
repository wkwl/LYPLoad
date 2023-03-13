//
//  LYPLoad.h
//  loadingAnimation
//
//  Created by sgx_05 on 2023/3/13.
//  Copyright © 2023 张永强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+LYPToast.h"
#import "LYPLoadingView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LYPLoad : NSObject


+(void)showLoading;

+(void)showLoadingType:(LYPLoadingType )loadType;

+(void)hideLoading;

@end

NS_ASSUME_NONNULL_END
