//
//  Global.h
//  wzf
//
//  Created by wzf on 13-9-23.
//  Copyright (c) 2013年 andylee1988. All rights reserved.
//



static NSString *const AppVersion = @"v1.0_20160107_1710";
static int NetworkTimeoutTime = 10;


#pragma mark - Server Address


// 服务器地址
#if 1  //1外网 0内网

static NSString *const kBaseUrl = @"";
static NSString *const kBasePhotoUrl = @"";


#else

static NSString *const kBaseUrl = @"http://192.168.3.3:8002/api/";
static NSString *const kBasePhotoUrl = @"http://192.168.3.3:8002";

#endif

// 自定义Log
#if 0

#define DLog(format, ...)

#else

#define DLog(format, ...) NSLog(format, ## __VA_ARGS__)

#endif


//Login方法定义
static NSString *const API_USER_Login_NormalLogin = @"NormalLogin";
static NSString *const API_USER_Login_ThirdLogin = @"ThirdLogin";
//error text
static NSString *const ErrorServer = @"服务器连接失败";


//角度
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * 3.14159265)

// 颜色
#pragma mark - Default Color

#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define TITLECOLOR  [UIColor colorWithRed:(145)/255.0f green:(145)/255.0f blue:(145)/255.0f alpha:1]
#define BACKGROUDNDCOLOR  [UIColor colorWithRed:(236)/255.0f green:(235)/255.0f blue:(243)/255.0f alpha:1];
#define NavTabbarColor RGBACOLOR(247.0f, 139.0f, 49.0f, 1.0f)

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//从RGB转换成UIColor （16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//设置带透明度
#define UIColorFromRGBA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

//字体大小设置
#pragma mark - Default Font

#define FONT_SIZE(_font) [UIFont systemFontOfSize:_font]//设置字体大小

// 适配比例
#define RATIO [Flexible ratio]

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCALE_SCREEN ([UIScreen mainScreen].scale)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_4 (IS_IPHONE && SCREEN_MAX_LENGTH == 480.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)


#define IS_IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9)
#define IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)
#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)


#define MyAppDelegate ((AppDelegate *)([UIApplication sharedApplication].delegate))
//静态变量
#pragma mark - Define

static NSString *const kPhotoChangeKey = @"kPhotoChangeKey";
static NSString *const kMyUserVOKey = @"kMyUserVOKey";
static NSString *const SystemServerID = @"SystemServerID";
static NSString *const kVersion = @"kVersion";
static NSString *const kToken = @"kToken";
static NSString *const KWebRegex = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";


#pragma mark - Default Value

typedef enum {
    PushVC,
    ZoomVC
}PushWay;

static CGFloat const TitleLabelY = 28;
static CGFloat const BackButtonY = 26;
static CGFloat const kSegmentHeight = 64;
static CGFloat const NAVIGATION_BAR_HEIGHT = 64;
static CGFloat const kTabBarH = 48.0f;
static CGFloat const STATUS_BAR_HEIGHT = 20.0f;

#pragma mark - GlobalStoreTable

static NSString *const ActiviteClassStoreTable = @"ActiviteClassStoreTable";


#pragma mark - Cell Identifier
static NSString *const DebtCellIdentifier = @"DebtCellIdentifier";

#pragma mark - Notification

static NSString *const BadgeShowNotifaction = @"BadgeShowNotifaction";
static NSString *const BadgeHiddenNotifaction = @"BadgeHiddenNotifaction";

static NSString *const NumAllRefreshNotifaction = @"NumAllRefreshNotifaction";
static NSString *const NumNotifaction = @"NumNotifaction";
static NSString *const NumOneNotifaction = @"NumOneNotifaction";
static NSString *const NumTwoNotifaction = @"NumTwoNotifaction";
static NSString *const NumThreeNotifaction = @"NumThreeNotifaction";


#pragma mark - URL

//#define kBaseURL1 @"http://192.168.1.49"
//用户登录
static NSString * API_LOGIN_PATH = @"";

