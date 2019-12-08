//
//  KLViewController.m
//  KLCircleProgress
//
//  Created by Kalanhall@163.com on 12/06/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import "KLViewController.h"
@import KLCircleProgress;
@import Masonry;
@import KLCategory;

@interface KLViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSTimer *timer1;
@property (strong, nonatomic) NSTimer *timer2;
@property (strong, nonatomic) NSTimer *timer3;

@property (strong, nonatomic) KLCircleProgress *progressView1;
@property (strong, nonatomic) KLCircleProgress *progressView2;
@property (strong, nonatomic) KLCircleProgress *progressView3;

@end

@implementation KLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    KLCircleConfig *config = KLCircleConfig.alloc.init;
    config.trackTintColor = [UIColor colorWithRed:254/255.0 green:247/255.0 blue:204/255.0 alpha:1];
    config.colors = @[[UIColor kl_colorWithHexNumber:0x2ACAF7], [UIColor kl_colorWithHexNumber:0xEAE115], [UIColor kl_colorWithHexNumber:0xFF5500]];
    config.lineWidth = 30;
    config.animationDuration = 1;
    config.circleType = KLCircleTypeGradientView;
    self.progressView1 = [KLCircleProgress.alloc initWithFrame:CGRectZero config:config];
    self.progressView1.centerLabel.text = @"0℃";
    [self.view addSubview:self.progressView1];
    [self.progressView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(self.view.mas_height).multipliedBy(1/3.5);
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(20);
    }];

    __weak typeof(self) ws = self;
    __block CGFloat index = 0;
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        index += (1/10.0);
        if (index >= 1) {
            [timer invalidate];
            return;
        }
        [ws.progressView1 setProgress:index animated:YES];
        ws.progressView1.centerLabel.text = [NSString stringWithFormat:@"%.0f℃", index * 100];
        [ws.slider setValue:index animated:YES];
    }];

    self.progressView1.animatedCompletion = ^(CGFloat progress, BOOL finish) {
        NSLog(@"progressView1 finish %f %d", progress, finish);
    };
    
    config = KLCircleConfig.alloc.init;
    config.trackTintColor = [UIColor colorWithRed:254/255.0 green:247/255.0 blue:204/255.0 alpha:1];
    config.colors = @[[UIColor kl_colorWithHexNumber:0xEAE115], [UIColor kl_colorWithHexNumber:0xFF5500]];
    config.lineWidth = 30;
    config.animationDuration = 1;
    config.circleType = KLCircleTypeGradientView;
    self.progressView2 = [KLCircleProgress.alloc initWithFrame:CGRectZero config:config];
    self.progressView2.centerLabel.text = @"0℃";
    [self.view addSubview:self.progressView2];
    [self.progressView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(self.view.mas_height).multipliedBy(1/3.5);
        make.center.mas_equalTo(0);
    }];
    
    __block CGFloat index2 = 0;
    self.timer2 = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        index2 += (1/10.0);
        if (index2 >= 1) {
            [timer invalidate];
            return;
        }
        [ws.progressView2 setProgress:index2 animated:YES];
        ws.progressView2.centerLabel.text = [NSString stringWithFormat:@"%.0f℃", index2 * 100];
    }];

    self.progressView2.animatedCompletion = ^(CGFloat progress, BOOL finish) {
        NSLog(@"progressView2 finish %f %d", progress, finish);
    };
    
    config = KLCircleConfig.alloc.init;
    config.trackTintColor = [UIColor colorWithRed:254/255.0 green:247/255.0 blue:204/255.0 alpha:1];
    config.lineWidth = 30;
    config.animationDuration = 1;
    config.circleType = KLCircleTypeGradientLayer;
    config.colors = @[[UIColor kl_colorWithHexNumber:0xC10D00],
                      [UIColor kl_colorWithHexNumber:0xFF6A00],
                      [UIColor kl_colorWithHexNumber:0xC20E02]];
    self.progressView3 = [KLCircleProgress.alloc initWithFrame:CGRectZero config:config];
    self.progressView3.centerLabel.text = @"0℃";
    [self.view addSubview:self.progressView3];
    [self.progressView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(self.view.mas_height).multipliedBy(1/3.5);
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-20);
    }];
//    self.progressView3.progress = 0.6;
    
    __block CGFloat index3 = 0;
    self.timer3 = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        index3 += (1/10.0);
        if (index3 >= 1) {
            [timer invalidate];
            return;
        }
        [ws.progressView3 setProgress:index3 animated:YES];
        ws.progressView3.centerLabel.text = [NSString stringWithFormat:@"%.0f℃", index3 * 100];
    }];

    self.progressView3.animatedCompletion = ^(CGFloat progress, BOOL finish) {
        NSLog(@"progressView3 finish %f %d", progress, finish);
    };
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (IBAction)xxx:(UISlider *)sender {
    [self.timer1 invalidate];
    [self.timer2 invalidate];
    [self.timer3 invalidate];
    self.progressView1.progress = sender.value;
    self.progressView1.centerLabel.text = [NSString stringWithFormat:@"%.0f℃", sender.value * 100];
    self.progressView2.progress = sender.value;
    self.progressView2.centerLabel.text = [NSString stringWithFormat:@"%.0f℃", sender.value * 100];
    self.progressView3.progress = sender.value;
    self.progressView3.centerLabel.text = [NSString stringWithFormat:@"%.0f℃", sender.value * 100];
}

@end
