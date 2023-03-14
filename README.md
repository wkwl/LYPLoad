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
1.pod 'LYPLoad'

2.也可以将LYPLoad/LYPLoad/Classes/中的内容拖进项目使用（需要自己添加Masonry）

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

### 示例图片
<div style="display:flex;flex-direction:row">
<img src = "https://github.com/wkwl/ImageSpec/blob/master/LYPLoad/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-03-13%20at%2016.00.41.png?raw=true" width="200" />

<img src = "https://github.com/wkwl/ImageSpec/blob/master/LYPLoad/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-03-13%20at%2016.01.08.png?raw=true" width="200" />
</div>

