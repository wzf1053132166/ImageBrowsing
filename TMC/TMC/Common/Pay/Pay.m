//
//  Pay.m
//  aichediandian
//
//  Created by MACPRO  on 16/6/14.
//  Copyright © 2016年 rwxChina. All rights reserved.
//

/*
 支付调用
 wangzhifei
 2016/6/14
*/

#import "Pay.h"

@implementation Pay

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [[NSBundle mainBundle] loadNibNamed:[[self class] description] owner:self options:nil];
        
        [self addSubview:_payMoney];
        [UIView animateWithDuration:0.3 animations:^{
            
            _payMoney.frame = CGRectMake(0, -SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
        } completion:^(BOOL finished) {
            
        }];
        
    }
    return self;
}


@end
