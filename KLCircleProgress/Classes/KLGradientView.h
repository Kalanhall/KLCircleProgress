//
//  KLGradientView.h
//  ProgressView
//
//  Created by sxiaojian on 15/10/29.
//  Copyright © 2015年 sxiaojian. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface KLGradientView : UIView

/// 动画时间
@property (nonatomic, assign) CGFloat animationDuration;

/// 构造初始化方法
- (instancetype)initWithFrame:(CGRect)frame startColor:(UIColor *)startColor endColor:(UIColor *)endColor lineWidth:(CGFloat)lineWidth;
- (instancetype)initWithFrame:(CGRect)frame colors:(NSArray <UIColor *> *)colors lineWidth:(CGFloat)lineWidth;
/// 设置进度
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

// 翻转渐变颜色
- (void)reverseGradienColor;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

@end
