//
//  CommonAPI.m
//  Keaai
//
//  Created by zhouzhengan on 14-8-21.
//  Copyright (c) 2014年 DaiMeng Tech. All rights reserved.
//

#import "CommonAPI.h"


#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "MainTabBarViewController.h"


#import "Global.h"

#define height_5 38
#define height_6 38.671875
#define height_6P 42.693750000000001

const double x_pi = M_PI * 3000.0 / 180.0;

@implementation CommonAPI

+(BOOL)isLegalPhoneNumber:(NSString*)inputString
{
    if ([inputString isEqual:nil])
    {
        return FALSE;
    }
    
    if ([inputString length] != 11)
    {
        return FALSE;
    }
    
    
    //手机号规则,以1开头的11位数字 (为了避免将来手机号的扩展,规则放得比较宽) ^代表从行首开始匹配, $代表匹配到行尾,也就是说行首和行尾都不能有多余的字符
    NSString *phoneRegex = @"^1\\d{10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:inputString];
}

+ (void)store:(id)aObject to:(NSString*)strKey {
    NSMutableData *mData = [[NSMutableData alloc] init];
    NSKeyedArchiver *myKeyedArchiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mData];
    [myKeyedArchiver encodeObject:aObject];
    [myKeyedArchiver finishEncoding];
    [[NSUserDefaults standardUserDefaults] setObject:mData forKey:strKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)getObject:(NSString*)strKey {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:strKey];
    if ([data length] > 0) {
        NSKeyedUnarchiver *myKeyedUnarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        id aObject = [myKeyedUnarchiver decodeObject];
        return aObject;
    }
    return nil;
}

+ (NSMutableArray *)componentsSeparatedByStr:(NSString *)string
{
    // 以空格进行分割
    NSArray *arrTmp = [string componentsSeparatedByString:@" "];
    // 初始化一个可变数组
    NSMutableArray *mutArr = [NSMutableArray array];
    // 循环遍历数组中的内容
    for (int i = 0; i < arrTmp.count; i++) {
        NSString *result = [arrTmp objectAtIndex:i];
        DLog(@"result is %@",result);
        // 追加到可变数组中
        [mutArr addObject:result];
    }
    
    return mutArr;
}

+ (NSString *)setObjectDefaults:(NSString *)string forKey:(NSString *)forKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:string forKey: forKey];
    [defaults synchronize];
    return string;
}

+ (NSString *)getObjectDefaults:(NSString *)forKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *string = [defaults objectForKey:forKey];
    return string;
}

+ (NSMutableAttributedString *)fontSize:(UIFont *)font changeString:(NSString *)changeString range:(NSRange)range color:(UIColor *)color
{
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:changeString];
    
    [AttributedStr addAttribute:NSFontAttributeName
     
                          value:font
     
                          range:range];
    [AttributedStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName
     
                          value:color
     
                          range:range];
    
    return AttributedStr;
}

+ (NSString *)JudgeWeek{
//    NSArray * arrWeek=[NSArray arrayWithObjects:@"星期六",@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五", nil];
//    NSDate *date = [NSDate date];
//    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//    NSDateComponents *comps = [[NSDateComponents alloc] init];
//    NSInteger unitFlags = NSYearCalendarUnit |
//    NSMonthCalendarUnit |
//    NSDayCalendarUnit |
//    NSWeekdayCalendarUnit |
//    NSHourCalendarUnit |
//    NSMinuteCalendarUnit |
//    NSSecondCalendarUnit;
//    comps = [calendar components:unitFlags fromDate:date];
//    NSInteger week = [comps weekday];
//    NSInteger year=[comps year];
//    NSInteger month = [comps month];
//    NSInteger day = [comps day];
//    DLog(@"%@",[NSString stringWithFormat:@"%ld年%ld月",(long)year,(long)month]);
//    DLog(@"%@",[NSString stringWithFormat:@"%ld",(long)day]);
//    DLog(@"%@",[NSString stringWithFormat:@"%@",[arrWeek objectAtIndex:week]]);
//    return [arrWeek objectAtIndex:week];
    return @"";
}
+ (NSInteger)networkStatus
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.apple.com"];
    return [reachability currentReachabilityStatus];
}

+ (void)netWorkChangeStatus{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(!MyAppDelegate.isReachable){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"网络连接断开" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
//          [MBProgressHUD showError:@"网络连接断开"];
        }
    });

}

+(UIView *)fromTheBottomUpWhite:(UIView *)tabView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    view.backgroundColor = [UIColor clearColor];
    view.userInteractionEnabled = YES;
    [tabView addSubview:view];
    return view;
}

+(UIView *)fromTheBottomUpGray:(UIView *)tabView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.3;
    view.userInteractionEnabled = YES;
    [tabView addSubview:view];
    return view;
}

#pragma mark -- 返回文字的宽度
+ (float)widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height
{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize sizeToFit = [value boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:attribute context:nil].size;
    return sizeToFit.width;
}
+ (CGSize)widthForString:(NSString *)value fontSize:(float)fontSize
{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize sizeToFit = [value boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:attribute context:nil].size;
    return sizeToFit;
}

#pragma mark - Label Fit Weight And Height

+ (CGSize)fitSizeWithLabel:(UILabel*)aLabel {
    
    CGSize size_info = CGSizeMake(aLabel.frame.size.width, MAXFLOAT);
    UIFont *font_info = aLabel.font;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle  alloc] init];
    paragraphStyle.alignment = aLabel.textAlignment;
    paragraphStyle.lineBreakMode = aLabel.lineBreakMode;
    
    CGSize theSize = [aLabel.text boundingRectWithSize:size_info options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys: font_info, NSFontAttributeName, paragraphStyle, NSParagraphStyleAttributeName, nil] context:nil].size;
    
    return theSize;
}
+ (float)getWidthWithLabel:(UILabel*)aLabel {
    
    CGSize size_info = CGSizeMake(MAXFLOAT, aLabel.frame.size.height);
    UIFont *font_info = aLabel.font;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle  alloc] init];
    paragraphStyle.alignment = aLabel.textAlignment;
    paragraphStyle.lineBreakMode = aLabel.lineBreakMode;
    
    CGSize theSize = [aLabel.text boundingRectWithSize:size_info options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys: font_info, NSFontAttributeName, paragraphStyle, NSParagraphStyleAttributeName, nil] context:nil].size;
    
    return theSize.width;
}
+ (NSMutableArray *)setArrayDefaults:(NSMutableArray *)string forKey:(NSString *)forKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:string forKey: forKey];
    [defaults synchronize];
    return string;
}
+ (NSMutableArray *)getArrayDefaults:(NSString *)forKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *string = [defaults objectForKey:forKey];
    return string;
}

+ (NSDictionary *)setDictDefaults:(NSDictionary *)string forKey:(NSString *)forKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:string forKey: forKey];
    [defaults synchronize];
    return string;
}

+ (NSDictionary *)getDictDefaults:(NSString *)forKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *string = [defaults objectForKey:forKey];
    return string;
}

+ (CGSize)fitSizeWithString:(NSString*)str font:(UIFont*)aFont lineBreakMode:(NSLineBreakMode)aLineBreakMode width:(float)aWidth {
    
    CGSize size_info = CGSizeMake(aWidth, MAXFLOAT);
    UIFont *font_info = aFont;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle  alloc] init];
    //    paragraphStyle.lineBreakMode = aLineBreakMode;
    
    CGSize theSize = [str boundingRectWithSize:size_info options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys: font_info, NSFontAttributeName, paragraphStyle, NSParagraphStyleAttributeName, nil] context:nil].size;
    
    
    return theSize;
}

+ (float)fitWidthWithString:(NSString*)str font:(UIFont*)aFont lineBreakMode:(NSLineBreakMode)aLineBreakMode {
    
    CGSize size_info = CGSizeMake(MAXFLOAT, aFont.lineHeight);
    UIFont *font_info = aFont;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle  alloc] init];
    //    paragraphStyle.lineBreakMode = aLineBreakMode;
    
    CGSize theSize = [str boundingRectWithSize:size_info options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys: font_info, NSFontAttributeName, paragraphStyle, NSParagraphStyleAttributeName, nil] context:nil].size;
    
    return theSize.width;
}
+(NSAttributedString *)getAttributedStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace; // 调整行间距
    NSRange range = NSMakeRange(0, [string length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    return attributedString;
}
#pragma mark -- 查找替换字符串(url)
+ (NSString *)findWithReplacement:(NSString *)string{
    
    NSString *strN = [string stringByReplacingOccurrencesOfString :@"../" withString:@""];
    NSString *strResult = [NSString stringWithFormat:@"%@%@",kBaseUrl,strN];
    return strResult;
}

//对图片尺寸进行压缩--
+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

+ (MJRefreshGifHeader*)headerRefeshing:(MJRefreshGifHeader *)header
{
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=60; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
        [idleImages addObject:image];
    }
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImages addObject:image];
    }
       // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = NO;
    header.stateLabel.font = FONT_SIZE(13);
    header.lastUpdatedTimeLabel.font = FONT_SIZE(12);
    // 隐藏状态
    header.stateLabel.hidden = NO;
    // 设置普通状态的动画图片
    [header setImages:idleImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [header setImages:idleImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
   
    return header;
}

+ (MJRefreshBackGifFooter*)footerRefeshing:(MJRefreshBackGifFooter *)footer
{
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=60; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
        [idleImages addObject:image];
    }
    
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImages addObject:image];
    }
    
    // 隐藏状态
    footer.stateLabel.hidden = YES;
    // 设置普通状态的动画图片
    [footer setImages:idleImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [footer setImages:refreshingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [footer setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    return footer;
}

+ (NSDateFormatter *)dateFormatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    
    return dateFormatter;
}
+ (NSDateFormatter *)dateFormatterTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy年MM月dd日 HH时"];
    
    return dateFormatter;
}
#pragma mark -- 跳转商圈页面
+ (void)gotoRootViewController:(UIViewController *)viewVC
{
    MyAppDelegate.mainTabbarVC.selectedIndex = 2;// 默认第2个
    viewVC.view.window.rootViewController = MyAppDelegate.mainTabbarVC;
}
#pragma mark -- 画圆角
+ (void)drawTheRounded:(UIView *)view corners:(UIRectCorner)corners radii:(CGSize)radii{
    UIBezierPath * maskPaths = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:radii];
    
    CAShapeLayer * maskLayers = [[CAShapeLayer alloc] init];
    maskLayers.frame = view.bounds;
    maskLayers.path =  maskPaths.CGPath;
    view.layer.mask = maskLayers;
}
#pragma mark -- 判断是否允许访问相机
+ (BOOL)isAVCaptureActive
{
    AVCaptureDevice *aDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *inputError = nil;
    AVCaptureDeviceInput *aInput = [AVCaptureDeviceInput deviceInputWithDevice:aDevice error:&inputError];
    
    if (aInput == nil)
    {
        DLog(@"init AVCapture fail--%@",inputError);
        
        return NO;
    }
    
    return YES;
}

#pragma mark -- 下载图片
+ (UIImage *)downLoadImage:(NSString *)url
{
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:
                                [NSURL URLWithString:url]
                                                cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    //将请求的url数据放到NSData对象中
    NSURLResponse *returningResponse = nil;
    
    NSData *fileData = [NSURLConnection sendSynchronousRequest:requestURL returningResponse:&returningResponse error:nil];
    
    UIImage *image=nil;
    
    image=[UIImage imageWithData:fileData];
    
    return image;
}
#pragma mark -- 超时隐藏
+ (void)hideView:(UIView *)superView{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUDForView:superView animated:YES];
    });

}

#pragma mark -- 保存图片
+ (NSString *)saveImage:(UIImage *)tempImage
{
    
    NSData* imageData;
    
    //判断图片是不是png格式的文件
    if (UIImagePNGRepresentation(tempImage)) {
        //返回为JPEG图像。
        imageData = UIImageJPEGRepresentation(tempImage,1.0);
        
    }else {
        //返回为JPEG图像。
        imageData = UIImageJPEGRepresentation(tempImage, 1.0);
    }
    
    NSString *imageString = [imageData base64EncodedStringWithOptions:0];
    
    return imageString;
}
#pragma mark -- 画tabbar背景色
+ (UIImage *)drawTabarItemBackgroundImageWithSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx, 124.0/255, 124.0/255, 151.0/255, 1);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark -- 播放系统声音
+(void)playAudio
{
    AudioServicesPlaySystemSound(1002);
}
#pragma mark -- 播放系统震动
+ (void)vibration
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

#pragma mark -- 清空数据
+(void)clearData{
    
}
#pragma mark -- 百度经纬度转高德
+(CLLocationCoordinate2D)transformBaiduFromMars:(double)bd_lat bd_lon:(double)bd_lon{
    
    double x = bd_lon - 0.0065, y = bd_lat - 0.006;
    double z = sqrt(x * x + y * y) - 0.00002 * sin(y * x_pi);
    double theta = atan2(y, x) - 0.000003 * cos(x * x_pi);
    double gg_lon = z * cos(theta);
    double gg_lat = z * sin(theta);
    return (CLLocationCoordinate2D){gg_lat, gg_lon};
}

#pragma mark - 从百度坐标到GPS坐标


#pragma mark -- 音乐播放
+ (void)playSound:(BOOL)custom{
    SystemSoundID _soundID;
    if (custom) {
        if (_soundID == 0) {
            SystemSoundID theSoundID;
            NSURL *tapSound   = [[NSBundle mainBundle] URLForResource: @"rwx" withExtension: @"mp3"];
            OSStatus error =  AudioServicesCreateSystemSoundID((__bridge CFURLRef)(tapSound), &theSoundID);
            if (error == kAudioServicesNoError) {
                _soundID = theSoundID;
            }else {
                NSLog(@"Failed to create sound ");
            }
        }
        if (_soundID != 0) {
            AudioServicesPlaySystemSound(_soundID);
        }else
            AudioServicesPlaySystemSound(1012);
        
    }else{
        AudioServicesPlaySystemSound(1012);
    }
    AudioServicesPlaySystemSound ( kSystemSoundID_Vibrate) ;
    
}

+ (NSString *) compareCurrentTime:(NSString *)str
{
    
    //把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *timeDate = [dateFormatter dateFromString:str];
    
    //得到与当前时间差
    NSTimeInterval  timeInterval = [timeDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    //标准时间和北京时间差8个小时
    timeInterval = timeInterval - 8*60*60;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}


+ (NSString *)compareTime:(NSString *)str
{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    NSDate *fromDate;
    NSDate *toDate;
    [gregorian rangeOfUnit:NSDayCalendarUnit startDate:&fromDate interval:NULL forDate:[dateFormatter dateFromString:str]];
    [gregorian rangeOfUnit:NSDayCalendarUnit startDate:&toDate interval:NULL forDate:[NSDate date]];
    NSDateComponents *dayComponents = [gregorian components:NSDayCalendarUnit fromDate:fromDate toDate:toDate options:0];
    NSString *day = @"0";
    if (fmodf(dayComponents.day,30) == 0) {
        day = [NSString stringWithFormat:@"%ld",dayComponents.day/30];
    }else{
        day = [NSString stringWithFormat:@"%ld",dayComponents.day/30+1];
    }

    return day;
}

+ (NSString *)compareNowTime:(NSString *)str
{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    NSDate *fromDate;
    NSDate *toDate;

    [gregorian rangeOfUnit:NSDayCalendarUnit startDate:&fromDate interval:NULL forDate:[dateFormatter dateFromString:str]];
    [gregorian rangeOfUnit:NSDayCalendarUnit startDate:&toDate interval:NULL forDate:[NSDate date]];
    NSDateComponents *dayComponents = [gregorian components:NSDayCalendarUnit fromDate:fromDate toDate:toDate options:0];
    

    NSString *day = [NSString stringWithFormat:@"%ld",dayComponents.day];
   
    return day;
}

+(NSString *)replaceStr:(NSString *)str{
//    NSString *string = [str stringByReplacingOccurrencesOfString:@"," withString:@""];
    NSString *stringNew = [str stringByReplacingOccurrencesOfString:@"""" withString:@""];
    
    return stringNew;
}
+(NSString *)replaceStrTime:(NSString *)str{
    NSString *string = [str stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    
    return string;
}
+ (NSString *)dateFormatter:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

#pragma mark -- 加减当前时间
+(NSString *)calculateTime:(int)num{
    //得到当前的时间
    NSDate * date = [NSDate date];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSTimeInterval time = num * 24 * 60 * 60;//月
    NSDate * lastYear = [date dateByAddingTimeInterval:-time];
    //转化为字符串
    NSString * startDate = [dateFormatter stringFromDate:lastYear];
    return startDate;
}

+ (NSString *)photoUrlWithFormat:(NSString *)str{
    NSString *photoUrl = [NSString stringWithFormat:@"%@%@",kBasePhotoUrl,str];
    return photoUrl;
}

// 判断当前视图控制器是否为活动的
+(BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController
{
    return (viewController.isViewLoaded && viewController.view.window);
}

@end
