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

@interface KLViewController ()

@property (strong, nonatomic) KLCircleProgress *progressView;

@end

@implementation KLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    KLCircleConfig *config = KLCircleConfig.alloc.init;
    config.trackTintColor = [UIColor colorWithRed:254/255.0 green:247/255.0 blue:204/255.0 alpha:1];
    config.startColor = [UIColor colorWithRed:251/255.0 green:212/255.0 blue:0 alpha:1];
    config.endColor = [UIColor colorWithRed:246/255.0 green:86/255.0 blue:4/255.0 alpha:1];
    config.lineWidth = 40;
    self.progressView = [KLCircleProgress.alloc initWithFrame:CGRectZero config:config];
    [self.view addSubview:self.progressView];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(300);
        make.center.mas_equalTo(0);
    }];
    
    [self.progressView setProgress:0.5 animated:YES];
    self.progressView.animationProgressCallBack = ^(CGFloat animationProgress) {
        NSLog(@"%f", animationProgress);
    };
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.progressView reverseGradienColor];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.progressView reverseGradienColor];
        });
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)xxx:(UISlider *)sender {
    self.progressView.progress = sender.value;
}

@end
