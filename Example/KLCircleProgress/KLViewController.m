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

@property (strong, nonatomic) KLCircleProgress *progressView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation KLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    KLCircleConfig *config = KLCircleConfig.alloc.init;
    config.trackTintColor = [UIColor colorWithRed:254/255.0 green:247/255.0 blue:204/255.0 alpha:1];
    config.colors = @[[UIColor kl_colorWithHexNumber:0x2ACAF7], [UIColor kl_colorWithHexNumber:0xEAE115], [UIColor kl_colorWithHexNumber:0xFF5500], UIColor.purpleColor];
    config.lineWidth = 30;
    config.animationDuration = 1;
    self.progressView = [KLCircleProgress.alloc initWithFrame:CGRectZero config:config];
    self.progressView.centerLabel.text = @"0℃";
    [self.view addSubview:self.progressView];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(200);
        make.center.mas_equalTo(0);
    }];
    
//    [self.slider setValue:0.5 animated:YES];
//    [self.progressView setProgress:0.5 animated:YES];
        

    __weak typeof(self) ws = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [ws.progressView reverseGradienColor];
        
        __block CGFloat index = 0;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            index += (1/100.0);
            [ws.progressView setProgress:index animated:YES];
            [ws.slider setValue:index animated:YES];
            ws.progressView.centerLabel.text = [NSString stringWithFormat:@"%.0f℃", index * 100];
            if (index > 1) {
                [timer invalidate];
            }
        }];
//    });
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
    [self.timer invalidate];
    self.progressView.progress = sender.value;
    self.progressView.centerLabel.text = [NSString stringWithFormat:@"%.0f℃", sender.value * 100];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.timer invalidate];
    [self.progressView setProgress:1 animated:YES];
    [self.slider setValue:1 animated:YES];
}

@end
