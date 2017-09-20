//
//  HTTabBar+HTTabBarBageView.m
//  HotelsNow
//
//  Created by tc on 2017/4/26.
//  Copyright © 2017年 wzf. All rights reserved.
//

#import "HTTabBar+HTTabBarBageView.h"

@implementation UITabBar (HTTabBarBageView)

#define TabbarItemNums 4.0


//显示红点
- (void)showBadgeOnItmIndex:(int)index{
    [self removeBadgeOnItemIndex:index];
    //新建小红点
    UIView *bview = [[UIView alloc]init];
    bview.tag = 1888+index;
    bview.layer.cornerRadius = 4;
    bview.clipsToBounds = YES;
    bview.backgroundColor = [UIColor redColor];
    CGRect tabFram = self.frame;
    
    //float percentX = (index+0.6)/TabbarItemNums;
    CGFloat x = ceilf(0.9*tabFram.size.width);
    CGFloat y = ceilf(0.1*tabFram.size.height);
    bview.frame = CGRectMake(x, y, 8, 8);
   
    [self addSubview:bview];
    [self bringSubviewToFront:bview];
}
//隐藏红点
-(void)hideBadgeOnItemIndex:(int)index{
    [self removeBadgeOnItemIndex:index];
}
//移除控件
- (void)removeBadgeOnItemIndex:(int)index{
    
    for (UIView*subView in self.subviews) {
        if (subView.tag == 1888+index) {
            [subView removeFromSuperview];
        }
    }
}
@end
