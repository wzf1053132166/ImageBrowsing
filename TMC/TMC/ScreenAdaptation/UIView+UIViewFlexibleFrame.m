//
//  UIView+UIViewFlexibleFrame.m
//  ZLSwipeableViewDemo
//
//  Created by rimi on 15-6-11.
//  Copyright (c) 2015年 Zhixuan Lai. All rights reserved.
//

#import "UIView+UIViewFlexibleFrame.h"
#import "Flexible.h"

@implementation UIView (UIViewFlexibleFrame)

- (instancetype)initWithFlexibleFrame:(CGRect)flexibleFrame
{
    self = [self initWithFrame:[Flexible frameFromIphone5Frame:flexibleFrame]];
    return self;
}

@end
