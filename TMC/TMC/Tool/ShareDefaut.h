//
//  ShareDefaut.h
//  趣陪
//
//  Created by rimi on 15/6/30.
//  Copyright (c) 2015年 VagrancyWorkSpace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ShareDefaut : NSObject


@property (nonatomic,FM_STRONG) NSMutableArray *dataArray;
@property (nonatomic,FM_STRONG) NSMutableArray *numArray;
@property (nonatomic,assign) NSInteger flagNum;

+ (ShareDefaut *)share;

@end
