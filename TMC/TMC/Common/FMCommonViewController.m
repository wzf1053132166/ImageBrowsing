//
//  FMCommonViewController.m
//
//
//  Created by wangzhifei on 15/11/9.
//  Copyright © 2016年 keaai. All rights reserved.
//

#import "FMCommonViewController.h"
#import "Global.h"

@interface FMCommonViewController ()
{
    
}

@property (nonatomic, FM_STRONG) UIImageView *headImageView;

@end

@implementation FMCommonViewController

@synthesize headImageView;
@synthesize headerView;
@synthesize titleLabel;
@synthesize backButton;
@synthesize headerLine;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.view.backgroundColor = UIColorFromRGBA(0x3a2b46, 1);
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    float width = MyAppDelegate.window.frame.size.width < MyAppDelegate.window.frame.size.height ? MyAppDelegate.window.frame.size.width : MyAppDelegate.window.frame.size.height;
    
    float height = MyAppDelegate.window.frame.size.height > MyAppDelegate.window.frame.size.width ? MyAppDelegate.window.frame.size.height : MyAppDelegate.window.frame.size.width;
    
    self.view.frame = CGRectMake(0, 0, width, height);
    
    self.navigationController.navigationBarHidden = YES;

    //headerImageview
    headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, NAVIGATION_BAR_HEIGHT)];
    headImageView.image = [UIImage imageNamed:@"bgHead"];
    headImageView.backgroundColor = [UIColor clearColor];
    headImageView.userInteractionEnabled = YES;
    headImageView.clipsToBounds = YES;
    [self.view addSubview:headImageView];
    
    //header view
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, NAVIGATION_BAR_HEIGHT);
    headerView = [[UIView alloc] initWithFrame:rect];
    headerView.backgroundColor = [UIColor clearColor];
    headerView.userInteractionEnabled = YES;
    headerView.clipsToBounds = YES;
    [self.view addSubview:headerView];
    
    //header title
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, TitleLabelY, self.view.frame.size.width - 100, 24)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.userInteractionEnabled = YES;
    titleLabel.font = FONT_SIZE(17);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:titleLabel];
    
    
    headerLine = [[UIView alloc] initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT -0.5, self.view.frame.size.width, 0.5)];
    headerLine.backgroundColor = [UIColor blackColor];
    headerLine.alpha = 0.3;
    [self.view addSubview:headerLine];
    
    [self addBackButton];
}

- (void)addBackButton{
    
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, BackButtonY, 100, 40);
    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    backButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    backButton.imageEdgeInsets = UIEdgeInsetsMake(-10, -70, 0, 0);
    [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:backButton];
}

#pragma mark - 返回
-(void)backAction:(UIButton*)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)dealloc
{
    FM_DEALLOC();
}


- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}


@end

