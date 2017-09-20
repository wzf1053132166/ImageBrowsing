//
//  UpView.h
//  TMC
//
//  Created by jwgf on 2017/9/5.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpView : UIView
{
    MBProgressHUD *hud;
}

- (instancetype)initWithShow:(UIView *)view sureHandle:(dispatch_block_t)sureHandle cancelHandle:(dispatch_block_t)cancelHandle;

-(void)hiddenView;

@end
