//
//  KLCircleProgress.m
//  KLCircleProgress
//
//  Created by Kalan on 2019/12/6.
//

#import "KLCircleProgress.h"
#import "KLGradientView.h"

@implementation KLCircleConfig

@end

@interface KLCircleProgress ()

@property (strong, nonatomic) KLCircleConfig *config;
@property (strong, nonatomic) KLGradientView *gradientView;
@property (nonatomic, strong) CAShapeLayer *backgroundLayer;

@end

@implementation KLCircleProgress

- (instancetype)initWithFrame:(CGRect)frame config:(KLCircleConfig *)config
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        self.config = config;
        
        _backgroundLayer = [CAShapeLayer layer];
        _backgroundLayer.fillColor = [UIColor clearColor].CGColor;
        _backgroundLayer.strokeColor = config.trackTintColor.CGColor;
        _backgroundLayer.lineCap = kCALineCapRound;
        _backgroundLayer.lineWidth = config.lineWidth;
        [self.layer addSublayer:_backgroundLayer];
        
        self.gradientView = [KLGradientView.alloc initWithFrame:self.bounds
                                                     startColor:config.startColor
                                                       endColor:config.endColor
                                                      lineWidth:config.lineWidth];
        [self addSubview:self.gradientView];
        
        __weak typeof(self) weakself = self;
        self.gradientView.animationProgressCallBack = ^(CGFloat progress) {
            if (weakself.animationProgressCallBack) {
                weakself.animationProgressCallBack(progress);
            }
        };
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    /// 重置视图尺寸
    self.gradientView.frame = self.bounds;
}

-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self.gradientView setProgress:progress animated:NO];
}

/// 设置进度
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    [self.gradientView setProgress:progress animated:animated];
}

// 翻转渐变颜色
- (void)reverseGradienColor
{
    [self.gradientView reverseGradienColor];
}

- (void)drawRect:(CGRect)rect
{
    /// 绘制进度轨迹背景
    CGFloat startAngle = - M_PI_2;
    CGFloat endAngle = startAngle + (2.0 * M_PI);
    CGPoint center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.width / 2.0);
    CGFloat radius = (self.bounds.size.width - self.config.lineWidth) / 2.0;

    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = self.config.lineWidth;
    path.lineCapStyle = kCGLineCapRound;
    [path addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];

    _backgroundLayer.path = path.CGPath;
}

@end
