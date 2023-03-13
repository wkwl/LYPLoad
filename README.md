# LYPLoad

[![CI Status](https://img.shields.io/travis/sgx_05/LYPLoad.svg?style=flat)](https://travis-ci.org/sgx_05/LYPLoad)
[![Version](https://img.shields.io/cocoapods/v/LYPLoad.svg?style=flat)](https://cocoapods.org/pods/LYPLoad)
[![License](https://img.shields.io/cocoapods/l/LYPLoad.svg?style=flat)](https://cocoapods.org/pods/LYPLoad)
[![Platform](https://img.shields.io/cocoapods/p/LYPLoad.svg?style=flat)](https://cocoapods.org/pods/LYPLoad)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LYPLoad is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LYPLoad'
```

### 首先引入头文件 
```
#import <LYPLoad.h>

```
### 使用说明
```
1.默认为圆圈点加载动画
[LYPLoad showLoading];

2.线性加载动画
[LYPLoad showLoadingType:LYPLoadingTypeAnimationLine];

3.加载动画隐藏
[LYPLoad hideLoading];
```

## Author

sgx_05, 1877508948@qq.com

## License

LYPLoad is available under the MIT license. See the LICENSE file for more info.
