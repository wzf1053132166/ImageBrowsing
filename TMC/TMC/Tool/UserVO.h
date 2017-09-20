//
//  WCUserInfo.h
//  WeChat
//
//  Created by apple on 14/12/8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserVO : NSObject

@property (nonatomic, FM_STRONG) NSString *strUid;// 用户的Uid
@property (nonatomic, FM_STRONG) NSString *strGender;// 普通用户性别，1为男性，2为女性
@property (nonatomic, FM_STRONG) NSString *strNickName;// 普通用户昵称
@property (nonatomic, FM_STRONG) NSString *strAgentsum;// 代驾次数
@property (nonatomic, FM_STRONG) NSString *strAvglevel;// 等级
@property (nonatomic, FM_STRONG) NSString *strHeadImage;// 用户头像
@property (nonatomic, FM_STRONG) NSString *strMobile;// 手机号码
@property (nonatomic, FM_STRONG) NSString *strSynopsis;// 个人简介
@property (nonatomic, FM_STRONG) NSString *strUserInfoState;
@property (nonatomic, FM_STRONG) NSString *strToken;
@property (nonatomic,FM_STRONG) NSString *age; //驾龄
@property (nonatomic,FM_STRONG) NSString *userType;//催收员/管理员



//for weixin
@property (nonatomic, FM_STRONG) NSString *access_token;// access_token码
@property (nonatomic, FM_STRONG) NSString *openid;// 普通用户的标识，对当前开发者帐号唯一

@property (nonatomic, FM_STRONG) NSString *province;// 省份

@property (nonatomic, FM_STRONG) NSString *city;// 城市

@property (nonatomic, FM_STRONG) NSString *country;// 国家

@property (nonatomic, FM_STRONG) NSString *unionid;// 用户统一标识

//for third login
@property (nonatomic, FM_STRONG) NSString *thirdUid;// 第三方uid

@property (nonatomic, FM_STRONG) NSString *status;// 用户状态

@property (nonatomic, FM_STRONG) NSString *loginType;// 登录方式

@property BOOL loginStatus;//登录的状态 YES 登录过/NO 注销

@property (nonatomic, FM_STRONG) NSString *favorSex;//喜好性别（用于PK）1男，2女

@property (nonatomic, FM_STRONG) NSString *password;// 密码

@property (nonatomic, FM_STRONG) NSString  *pkIndex;


+ (UserVO *)userInfo;

-(void)regitserUserInfo:(NSDictionary*)aDicJson;

/**
 *  保存用户数据到沙盒
 */
-(void)saveUserInfo;

-(void)cleanUserInfo;

@end
