//
//  FMCommonViewController.h
//  FaceMaster
//
//  Created by yanzhidash on 15/11/9.
//  Copyright © 2015年 keaai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMCommonViewController : UIViewController

@property (nonatomic, FM_STRONG) UIView *headerView;
@property (nonatomic, FM_STRONG) UILabel *titleLabel;
@property (nonatomic, FM_STRONG) UIButton *backButton;
@property (nonatomic, FM_STRONG) UIView *headerLine;
-(void)backAction:(UIButton*)sender;

@end
