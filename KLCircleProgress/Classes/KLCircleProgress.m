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
        self.backgroundColor = UIColor.clearColor;
        self.config = config;
        
        /// 背景视图
        _backgroundLayer = [CAShapeLayer layer];
        _backgroundLayer.fillColor = [UIColor clearColor].CGColor;
        _backgroundLayer.strokeColor = config.trackTintColor.CGColor;
        _backgroundLayer.lineCap = kCALineCapRound;
        _backgroundLayer.lineWidth = config.lineWidth;
        [self.layer addSublayer:_backgroundLayer];
        
        self.gradientView = [KLGradientView.alloc initWithFrame:self.bounds colors:config.colors lineWidth:config.lineWidth];
        self.gradientView.animationDuration = config.animationDuration > 0 ? config.animationDuration : 1;
        [self addSubview:self.gradientView];
        
        self.centerLabel = UILabel.alloc.init;
        self.centerLabel.font = [UIFont boldSystemFontOfSize:20];
        self.centerLabel.textColor = config.colors.lastObject;
        self.centerLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.centerLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    /// 重置视图尺寸
    self.gradientView.frame = self.bounds;
    self.centerLabel.bounds = CGRectMake(0, 0, self.bounds.size.width - self.config.lineWidth * 2, 40);
    self.centerLabel.center = self.gradientView.center;
}

-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self.gradientView setProgress:progress animated:NO];
}

/// 设置进度
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    _progress = progress;
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
