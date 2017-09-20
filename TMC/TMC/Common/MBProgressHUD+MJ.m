//
//  MBProgressHUD+MJ.m
//  TMC
//
//  Created by wzf on 2017/9/5.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "MBProgressHUD+MJ.h"
#import "MBProgressHUD.h"

@implementation MBProgressHUD (MJ)


+ (void)show{
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:MyAppDelegate.window animated:YES];
//    hud.labelText = @"加载中…";
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:@"mss_browseLoading"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima.toValue = @(M_PI*2);
    anima.duration = 1.0f;
    anima.repeatCount = FLT_MAX;
    [imgView.layer addAnimation:anima forKey:nil];
    hud.customView = imgView;
    hud.sd_cornerRadius = [NSNumber numberWithInteger:1];
    
    hud.animationType = MBProgressHUDAnimationFade;
//    hud.minSize = CGSizeMake(120,70);
    
    DLog(@"---%@",API_LOGIN_PATH);
    UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btn:)];
    [hud addGestureRecognizer:tag];
}

+ (void)showView:(UIView *)contentView{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:contentView animated:YES];
    
    hud.labelText = @"加载中…";
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
    hud.sd_cornerRadius = [NSNumber numberWithInteger:1];
    
//    hud.backgroundView.alpha = 0.3;
//    hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:1];
//    //文字颜色
//    hud.contentColor = [UIColor whiteColor];
    hud.animationType = MBProgressHUDAnimationFade;
    //    hud.minSize = CGSizeMake(120,70);
    
    DLog(@"---%@",API_LOGIN_PATH);
    UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btn:)];
    [hud addGestureRecognizer:tag];
}


+(void)btn:(UITapGestureRecognizer *)tag{
    MBProgressHUD *tags = (MBProgressHUD *)tag.view;
//    [tags hideAnimated:YES];
    [tags hide:YES];
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
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

@end
