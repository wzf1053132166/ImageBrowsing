//
//  HUDProgress.h
//  TMC
//
//  Created by jwgf on 2017/9/5.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HUDProgress : UIView

@property (nonatomic,strong) MBProgressHUD *hud;

+(instancetype)share;

+ (void)show;
+ (void)dissmiss;
+ (void)showView:(UIView *)contentView;



+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
