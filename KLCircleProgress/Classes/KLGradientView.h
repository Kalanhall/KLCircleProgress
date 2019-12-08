//
//  KLGradientView.h
//  ProgressView
//
//  Created by sxiaojian on 15/10/29.
//  Copyright © 2015年 sxiaojian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLGradientView : UIView

/// 动画时间
@property (nonatomic, assign) CGFloat animationDuration;
@property (nonatomic, copy) void (^animatedCompletion)(CGFloat progress, BOOL finish);

/// 构造初始化方法
- (instancetype)initWithFrame:(CGRect)frame colors:(NSArray <UIColor *> *)colors lineWidth:(CGFloat)lineWidth;
/// 设置进度
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

// 翻转渐变颜色
- (void)reverseGradienColor;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

@end
