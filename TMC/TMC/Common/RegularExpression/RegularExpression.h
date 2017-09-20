//
//  Manager.h
//  Contact
//
//  Created by zz on 14/12/29.
//  Copyright (c) 2014年 zz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegularExpression : NSObject

//验证邮箱
+ (BOOL)validateEmail:(NSString *)email;

//验证手机
+ (BOOL)validateMobile:(NSString *)mobile;

//验证汽车
+ (BOOL)validateCarNo:(NSString *)carNo;

//验证用户名
+ (BOOL)validateUserName:(NSString *)name;

//验证密码
+ (BOOL)validatePassword:(NSString *)passWord;

//验证昵称
+ (BOOL)validateNickname:(NSString *)nickname;

//验证身份证
+ (BOOL)validateIdentityCard: (NSString *)identityCard;

//验证金额
+ (BOOL)validateMoney:(NSString *)money;

//验证webUrl
+ (BOOL)validateWebUrl:(NSString*)url;
@end
