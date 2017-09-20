//
//  UpView.m
//  TMC
//
//  Created by jwgf on 2017/9/5.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "UpView.h"

@interface UpView()<UIGestureRecognizerDelegate>

@property (nonatomic, copy) dispatch_block_t sureHandle;
@property (nonatomic, copy) dispatch_block_t cancelHandle;

@end

@implementation UpView


- (instancetype)initWithShow:(UIView *)view sureHandle:(dispatch_block_t)sureHandle cancelHandle:(dispatch_block_t)cancelHandle {
    
    self = [super init];
    for (UIView *v in self.subviews) {
        [v removeFromSuperview];
    }
    self.sureHandle = sureHandle;
    self.cancelHandle = cancelHandle;
    hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
//    hud.label.text = @"加载中…";
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:@"mss_browseLoading"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima.toValue = @(M_PI*2);
    anima.duration = 1.0f;
    anima.repeatCount = 999;
    [imgView.layer addAnimation:anima forKey:nil];
    hud.customView = imgView;
//    hud.backgroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:1];
//    hud.sd_cornerRadius = [NSNumber numberWithInteger:1];
//    
//    hud.backgroundView.alpha = 0.3;
//    hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:1];
//    //文字颜色
//    hud.contentColor = [UIColor whiteColor];
    hud.animationType = MBProgressHUDAnimationFade;
    //    hud.minSize = CGSizeMake(120,70);
    
    DLog(@"---%@",API_LOGIN_PATH);
    UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btn:)];
    [hud addGestureRecognizer:tag];
    
    return self;
}
- (void)hiddenView{
//    [hud hideAnimated:YES];
}

- (void)btn:(UITapGestureRecognizer *)tag{
    MBProgressHUD *tags = (MBProgressHUD *)tag.view;
//    [tags hideAnimated:YES];
    
    if (self.cancelHandle) {
        self.cancelHandle();
    }

}
@end
