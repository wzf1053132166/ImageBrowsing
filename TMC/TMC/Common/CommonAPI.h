//
//  CommonAPI.h
//  Keaai
//
//  Created by zhouzhengan on 14-8-21.
//  Copyright (c) 2014年 DaiMeng Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "MJRefresh.h"
#import "MJRefreshGifHeader.h"
#import "MJRefreshBackGifFooter.h"
#import "Const.h"

@interface CommonAPI : NSObject

+(BOOL)isLegalPhoneNumber:(NSString*)inputString;

+ (void)store:(id)aObject to:(NSString*)strKey;

+ (id)getObject:(NSString*)strKey;

+ (NSMutableArray *)componentsSeparatedByStr:(NSString *)string;

+ (NSString *)setObjectDefaults:(NSString *)string forKey:(NSString *)forKey;

+ (NSString *)getObjectDefaults:(NSString *)forKey;

+ (NSMutableAttributedString *)fontSize:(UIFont *)font changeString:(NSString *)changeString range:(NSRange)range color:(UIColor *)color;

+ (NSString *)JudgeWeek;

+(UIView *)fromTheBottomUpGray:(UIView *)tabView;

+(UIView *)fromTheBottomUpWhite:(UIView *)tabView;

+ (float)widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height;

+ (CGSize)widthForString:(NSString *)value fontSize:(float)fontSize;

+ (NSAttributedString *)getAttributedStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace;
#pragma mark - Label Weight And Height
+ (CGSize)fitSizeWithLabel:(UILabel*)aLabel;

+ (float)getWidthWithLabel:(UILabel*)aLabel;

+ (CGSize)fitSizeWithString:(NSString*)str font:(UIFont*)aFont lineBreakMode:(NSLineBreakMode)aLineBreakMode width:(float)aWidth;

+ (float)fitWidthWithString:(NSString*)str font:(UIFont*)aFont lineBreakMode:(NSLineBreakMode)aLineBreakMode;

+ (NSString *)findWithReplacement:(NSString *)string;

+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

+ (MJRefreshGifHeader*)headerRefeshing:(MJRefreshGifHeader *)header;

+ (MJRefreshBackGifFooter*)footerRefeshing:(MJRefreshBackGifFooter *)footer;

+ (NSDateFormatter *)dateFormatter;

+ (NSDateFormatter *)dateFormatterTime;

+ (void)gotoRootViewController:(UIViewController *)viewVC;

+ (void)drawTheRounded:(UIView *)view corners:(UIRectCorner)corners radii:(CGSize)radii;

+ (BOOL)isAVCaptureActive;

+ (UIImage *)downLoadImage:(NSString *)url;

+ (void)hideView:(UIView *)superView;

+ (NSString *)saveImage:(UIImage *)tempImage;

+ (UIImage *)drawTabarItemBackgroundImageWithSize:(CGSize)size;

+(void)playAudio;

+ (void)vibration;

+(void)clearData;

//+(CLLocationCoordinate2D)transformBaiduFromMars:(double)bd_lat bd_lon:(double)bd_lon;

+ (void)playSound:(BOOL)custom;

+ (NSMutableArray *)setArrayDefaults:(NSMutableArray *)string forKey:(NSString *)forKey;
+ (NSMutableArray *)getArrayDefaults:(NSString *)forKey;
+ (NSDictionary *)setDictDefaults:(NSDictionary *)string forKey:(NSString *)forKey;

+ (NSDictionary *)getDictDefaults:(NSString *)forKey;


+ (NSString *) compareCurrentTime:(NSString *)str;
+ (NSString *)compareTime:(NSString *)str;

+(NSString *)replaceStr:(NSString *)str;

+ (NSString *)dateFormatter:(NSDate *)date;

+ (NSString *)compareNowTime:(NSString *)str;

+(NSString *)calculateTime:(int)num;

+ (NSInteger)networkStatus;

+ (void)netWorkChangeStatus;

+ (NSString *)photoUrlWithFormat:(NSString *)str;

+(NSString *)replaceStrTime:(NSString *)str;

+(BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController;

@end
