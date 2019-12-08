//
//  KLCircleProgress.h
//  KLCircleProgress
//
//  Created by Kalan on 2019/12/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KLCircleConfig : NSObject

/// 默认轨道背景色
@property (strong, nonatomic) UIColor *trackTintColor;
/// 颜色渐变数组，目前最多支持4种颜色渐变
@property (strong, nonatomic) NSArray <UIColor *> *colors;
/// 线宽
@property (assign, nonatomic) CGFloat lineWidth;
/// 动画时间，更新动画的频率，和定时器执行频率设为一致最佳
@property (nonatomic, assign) CGFloat animationDuration;

@end

@interface KLCircleProgress : UIView

/// 当前进度
@property (assign, nonatomic) CGFloat progress;

/// 渐变进度条初始化方法
///
/// 使用示例
///
///        KLCircleConfig *config = KLCircleConfig.alloc.init;
///        config.trackTintColor = [UIColor colorWithRed:254/255.0 green:247/255.0 blue:204/255.0 alpha:1];
///        config.startColor = [UIColor colorWithRed:251/255.0 green:212/255.0 blue:0 alpha:1];
///        config.endColor = [UIColor colorWithRed:246/255.0 green:86/255.0 blue:4/255.0 alpha:1];
///        config.lineWidth = 40;
///        self.progressView = [KLCircleProgress.alloc initWithFrame:CGRectZero config:config];
///        [self.view addSubview:self.progressView];
///        [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
///            make.width.height.mas_equalTo(300);
///            make.center.mas_equalTo(0);
///        }];
///
///        self.progressView.progress = 1;
///        self.progressView.animationProgressCallBack = ^(CGFloat animationProgress) {
///            NSLog(@"%f", animationProgress);
///        };
///
/// @param frame 尺寸位置
/// @param config 配置实例
///
/// @return 进度条实例
- (instancetype)initWithFrame:(CGRect)frame config:(KLCircleConfig *)config;
/// 设置进度
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;
// 翻转渐变颜色
- (void)reverseGradienColor;

@end

NS_ASSUME_NONNULL_END
