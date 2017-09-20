//
//  Flexible.m
//  屏幕适配
//
//  Created by rimi on 15-6-11.
//  Copyright (c) 2015年 guojinxin. All rights reserved.
//

#import "Flexible.h"

#define IPHONE5_SCREEN CGSizeMake(320,568)
#define IPHONE5_SCREEN_HOR CGSizeMake(568,320)
@implementation Flexible

//比值
+ (CGFloat)ratio
{
    return [UIScreen mainScreen].bounds.size.width/IPHONE5_SCREEN.width;
}

+ (CGFloat)flexibleFloat:(CGFloat)aFloat
{
    return aFloat * [self ratio];
}

+ (CGRect)frameFromIphone5Frame:(CGRect)iphone5Frame
{
    CGFloat x = [self flexibleFloat:iphone5Frame.origin.x];
    CGFloat y = [self flexibleFloat:iphone5Frame.origin.y];
    CGFloat width = [self flexibleFloat:iphone5Frame.size.width];
    CGFloat height = [self flexibleFloat:iphone5Frame.size.height];
    return CGRectMake(x, y, width, height);
}


+ (CGFloat)ratioHor
{
    return [UIScreen mainScreen].bounds.size.width/IPHONE5_SCREEN_HOR.width;
}

+ (CGFloat)flexibleFloatHor:(CGFloat)aFloat
{
    return aFloat * [self ratioHor];
}

+ (CGRect)frameFromIphone5FrameHor:(CGRect)iphone5Frame
{
    
    CGFloat x = [self flexibleFloatHor:iphone5Frame.origin.x];
    CGFloat y = [self flexibleFloatHor:iphone5Frame.origin.y];
    CGFloat width = [self flexibleFloatHor:iphone5Frame.size.width];
    CGFloat height = [self flexibleFloatHor:iphone5Frame.size.height];
    return CGRectMake(x, y, width, height);
}

@end
