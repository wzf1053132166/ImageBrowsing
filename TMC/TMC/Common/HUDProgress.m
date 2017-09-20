//
//  HUDProgress.m
//  TMC
//
//  Created by jwgf on 2017/9/5.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "HUDProgress.h"

static id instanceHUD = nil;

@interface HUDProgress()<UIGestureRecognizerDelegate>


@property (nonatomic, copy) dispatch_block_t certainHandle;
@property (nonatomic, copy) dispatch_block_t cancelHandle;
@end

@implementation HUDProgress

+(instancetype)share{
    if(!instanceHUD) {
        static dispatch_once_t onceToken = 0;
        dispatch_once(&onceToken, ^{
            instanceHUD = [[super alloc]init];
        });
    }
    return instanceHUD;
}


+ (void)show{
    
//    HUDProgress.share.hud = [MBProgressHUD showHUDAddedTo:MyAppDelegate.window animated:YES];
//    
//    HUDProgress.share.hud.label.text = @"加载中…";
//    HUDProgress.share.hud.mode = MBProgressHUDModeCustomView;
//    UIImage *image = [[UIImage imageNamed:@"mss_browseLoading"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
//    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
//    
//    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//    anima.toValue = @(M_PI*2);
//    anima.duration = 1.0f;
//    anima.repeatCount = 999;
//    [imgView.layer addAnimation:anima forKey:nil];
//    HUDProgress.share.hud.customView = imgView;
//    HUDProgress.share.hud.backgroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:1];
//    HUDProgress.share.hud.sd_cornerRadius = [NSNumber numberWithInteger:1];
//    
//    HUDProgress.share.hud.backgroundView.alpha = 0.3;
//    HUDProgress.share.hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:1];
//    //文字颜色
//    HUDProgress.share.hud.contentColor = [UIColor whiteColor];
//    HUDProgress.share.hud.animationType = MBProgressHUDAnimationFade;
//    //    hud.minSize = CGSizeMake(120,70);
//    
//    DLog(@"---%@",API_LOGIN_PATH);
//    UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btn:)];
//    [HUDProgress.share.hud addGestureRecognizer:tag];
}

+ (void)showView:(UIView *)contentView{
//    HUDProgress.share.hud = [MBProgressHUD showHUDAddedTo:contentView animated:YES];
//    
//    HUDProgress.share.hud.label.text = @"加载中…";
//    HUDProgress.share.hud.mode = MBProgressHUDModeCustomView;
//    UIImage *image = [[UIImage imageNamed:@"mss_browseLoading"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
//    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
//    
//    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//    anima.toValue = @(M_PI*2);
//    anima.duration = 1.0f;
//    anima.repeatCount = 999;
//    [imgView.layer addAnimation:anima forKey:nil];
//    HUDProgress.share.hud.customView = imgView;
//    HUDProgress.share.hud.backgroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:1];
//    HUDProgress.share.hud.sd_cornerRadius = [NSNumber numberWithInteger:1];
//    
//    HUDProgress.share.hud.backgroundView.alpha = 0.3;
//    HUDProgress.share.hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:1];
//    //文字颜色
//    HUDProgress.share.hud.contentColor = [UIColor whiteColor];
//    HUDProgress.share.hud.animationType = MBProgressHUDAnimationFade;
//    //    hud.minSize = CGSizeMake(120,70);
//    
//    DLog(@"---%@",API_LOGIN_PATH);
//    UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btn:)];
//    [HUDProgress.share.hud addGestureRecognizer:tag];
}

+ (void)dissmiss{
//    [HUDProgress.share.hud hideAnimated:YES];
}

+(void)btn:(UITapGestureRecognizer *)tag{
    MBProgressHUD *tags = (MBProgressHUD *)tag.view;
//    [tags hideAnimated:YES];
}

#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    // 设置图片
    //    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:1.0];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    //    [self show:error icon:@"error.png" view:view];
    [self show:error icon:nil view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    //    [self show:success icon:@"success.png" view:view];
    [self show:success icon:nil view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    
    [self hideHUDForView:view];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

@end
