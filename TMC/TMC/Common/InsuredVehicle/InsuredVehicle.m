//
//  InsuredVehicle.m
//  aichediandian
//
//  Created by MACPRO  on 16/6/13.
//  Copyright © 2016年 rwxChina. All rights reserved.
//

#import "InsuredVehicle.h"

#define KWIDTH 280
#define KHEIGHT 80

@implementation InsuredVehicle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [[NSBundle mainBundle] loadNibNamed:[[self class] description] owner:self options:nil];
        
//        _insuredVehicleView.frame = frame;
    
        [self addSubview:_insuredVehicleView];
        [UIView animateWithDuration:0.3 animations:^{
            
            _insuredVehicleView.frame = CGRectMake(0, -SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
        } completion:^(BOOL finished) {
            
        }];
        
    }
    return self;
}
//+ (instancetype)defaultPopupView{
//    return [[InsuredVehicle alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, KHEIGHT)];
//}
- (IBAction)slideActionClick:(UIButton *)sender {
    
//    if (20 == sender.tag) {
//        
//        NSString *sigText = [_sigInputTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//        if (sigText.length > 15 || sigText.length == 0) {
//            [MBProgressHUD showError:@"签名不能超过15字或不能为空"];
//            return;
//        }
//        
//        if ([self.delegate respondsToSelector:@selector(sendSigText:)]) {
//            [self.delegate sendSigText:sigText];
//        }
//        DLog(@"textfield is %@",_sigInputTextField.text);
//        
//        
//    }
//    LewPopupViewAnimationSlide *animation = [[LewPopupViewAnimationSlide alloc]init];
//    animation.type = LewPopupViewAnimationSlideTypeTopBottom;
//    [_parentVC lew_dismissPopupViewWithanimation:animation];
}

@end
