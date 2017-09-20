//
//  ShareDefaut.m
//  趣陪
//
//  Created by rimi on 15/6/30.
//  Copyright (c) 2015年 VagrancyWorkSpace. All rights reserved.
//

#import "ShareDefaut.h"


@implementation ShareDefaut

+ (ShareDefaut *)share
{
    static ShareDefaut *data = nil;
    if (!data) {
        data = [[ShareDefaut alloc]init];
    }
    return data;
}

-(id)init
{
    if (self = [super init]) {
        self.dataArray = [[NSMutableArray alloc]init];
        self.numArray = [[NSMutableArray alloc]init];
        self.flagNum = 0;
    }
    return self;
}

@end
