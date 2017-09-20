//
//  HTDES3Util.h
//  TMC
//
//  Created by tc on 2017/8/14.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTDES3Util : NSObject

// 加密方法
+(NSString*)encrypt:(NSString*)plainText;
// 解密方法
+(NSString*)decrypt:(NSString*)encryptText;

@end
