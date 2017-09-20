//
//  InsuranceCompanyView.m
//  aichediandian
//
//  Created by MACPRO  on 16/6/14.
//  Copyright © 2016年 rwxChina. All rights reserved.
//

#import "InsuranceCompanyView.h"

@implementation InsuranceCompanyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [[NSBundle mainBundle] loadNibNamed:[[self class] description] owner:self options:nil];
        
        _insuranceCompany.frame = frame;
        [self addSubview:_insuranceCompany];
        
        
    }
    return self;
}

@end
