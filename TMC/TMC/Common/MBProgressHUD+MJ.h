//
//  MBProgressHUD+MJ.h
//  TMC
//
//  Created by wzf on 2017/9/5.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "MBProgressHUD/MBProgressHUD.h"

@interface MBProgressHUD (MJ)

+ (void)show;
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
