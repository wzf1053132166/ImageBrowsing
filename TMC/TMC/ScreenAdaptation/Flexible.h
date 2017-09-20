//
//  Flexible.h
//  屏幕适配
//
//  Created by rimi on 15-6-11.
//  Copyright (c) 2015年 guojinxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Flexible : NSObject

+ (CGFloat)ratio;

+ (CGFloat)flexibleFloat:(CGFloat)aFloat;


+ (CGFloat)ratioHor;

+ (CGFloat)flexibleFloatHor:(CGFloat)aFloat;

+ (CGRect)frameFromIphone5Frame:(CGRect)iphone5Frame;


@end
