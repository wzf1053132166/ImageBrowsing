//
//  HWTabBar.m
//  wzf
//
//  Created by apple on 14-10-8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HWTabBar.h"
#import "UIView+Extension.h"
#import "HTTabBar+HTTabBarBageView.h"

@interface HWTabBar()

@end

@implementation HWTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews
{
// [super layoutSubviews] 一定要调用
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    for (int i = 0; i<count; i++) {
        UIView *child = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            
            UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/4*i, 13, 1, self.height-26)];
            [self addSubview:lineView1];
            lineView1.backgroundColor = kUIColorFromRGB(0xb2b2b2);
            lineView1.alpha = 0.5;
            
            
        }
    }
//    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//    if ([[userDefault valueForKey:@"pushType"] isEqualToString:@"1"]|[[userDefault valueForKey:@"pushType"] isEqualToString:@"2"]) {
    
//        [self showBadgeOnItmIndex:3];
//    }
    
}

@end
