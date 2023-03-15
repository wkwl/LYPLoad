# LYPLoad

[![CI Status](https://img.shields.io/travis/sgx_05/LYPLoad.svg?style=flat)](https://travis-ci.org/sgx_05/LYPLoad)
[![Version](https://img.shields.io/cocoapods/v/LYPLoad.svg?style=flat)](https://cocoapods.org/pods/LYPLoad)
[![License](https://img.shields.io/cocoapods/l/LYPLoad.svg?style=flat)](https://cocoapods.org/pods/LYPLoad)
[![Platform](https://img.shields.io/cocoapods/p/LYPLoad.svg?style=flat)](https://cocoapods.org/pods/LYPLoad)

## Description 

加载动画(支持自定义)，Toast弹框

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


自定义使用方式可参考：Example/LYPLoad/LYPViewController.m

4.toast弹框使用

[LYPLoad showToast:@"测试"];

也可以这样使用（第一种比较局限只添加到window上）
[self.view showToast:@"测试"];buhui


同时调用多次如：
[LYPLoad showLoading];
[LYPLoad showLoading];

不会同时出现在屏幕上，会在上一个隐藏后（[LYPLoad hideLoading]）再调起后面的加载框，避免了页面上同时出现多个加载框的问题，
也不会产生像单例调用时，偶尔会出现第二个弹框尚未弹出就被隐藏了，导致屏幕上无加载弹框出现的问题。
```

### 示例图片
<div style="display:flex;flex-direction:row">
<img src = "https://github.com/wkwl/ImageSpec/blob/master/LYPLoad/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-03-13%20at%2016.00.41.png?raw=true" width="200" />

<img src = "https://github.com/wkwl/ImageSpec/blob/master/LYPLoad/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-03-13%20at%2016.01.08.png?raw=true" width="200" />
</div>

