//
//  PXISARC.h
//
//
//  Created by wzf on 13-1-6.
//  Copyright (c) 2013年 wzf. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifndef STARC
#define STARC

#define FM_STRONG  strong
//#ifndef FM_STRONG
//#if __has_feature(objc_arc)
//#define FM_STRONG strong
//#else
//#define FM_STRONG retain
//#endif
//#endif

#define FM_WEAK  weak
//#ifndef FM_WEAK
//#if __has_feature(objc_arc_weak)
//#define FM_WEAK weak
//#elif __has_feature(objc_arc)
//#define FM_WEAK unsafe_unretained
//#else
//#define FM_WEAK 
//#endif
//#endif

#if __has_feature(objc_arc)
#define FM_AUTORELEASE(expression) expression
#define FM_RELEASE(expression) expression = nil
#define FM_RETAIN(expression) expression
#define FM_DEALLOC()
#else
#define FM_AUTORELEASE(expression) [expression autorelease]
#define FM_RELEASE(expression) [expression release],expression = nil
#define FM_RETAIN(expression) [expression retain]
#define FM_DEALLOC() [super dealloc]
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_5_0
#define FM_WEAK_SDWebImage
#else
#define FM_WEAK_SDWebImage __weak
#endif

#endif
