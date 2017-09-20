//
//  MineViewController.m
//  TMC
//
//  Created by tc on 2017/8/14.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bgView];
    
    UIView *headView = [[UIView alloc]init];
    headView.backgroundColor = [UIColor whiteColor];
    headView.layer.cornerRadius = 50/2;
    [bgView addSubview:headView];
    
    UILabel *headLabel = [[UILabel alloc]init];
    headLabel.text = @"swift与objective-c,swift与objective-cswift与objective-cswift与objective-cswift与objective-cswift与objective-cswift与objective-cswift与objective-cswift与objective-c";
    headLabel.font = [UIFont systemFontOfSize:15.0];
    [headLabel sizeToFit];
    headLabel.numberOfLines = 0;
    [bgView addSubview:headLabel];
    
    UILabel *instruction = [[UILabel alloc]init];
    instruction.text = @"享受编程之美";
    instruction.textAlignment = NSTextAlignmentRight;
    [bgView addSubview:instruction];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.view).offset(64);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(200);
        
    }];
    
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(bgView).offset(25);
        make.width.height.mas_equalTo(50);
    }];
    
    [headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headView).offset(10);
        make.left.equalTo(headView.mas_right).offset(10);
        make.right.equalTo(bgView.mas_right);
    }];
    
    [instruction mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bgView.mas_right).offset(-10);
        make.left.equalTo(bgView.mas_left).offset(10);
        make.bottom.equalTo(bgView.mas_bottom).offset(-10);
    }];
    
    
    NSArray *titleArray = @[@"我的主题",@"我的评论",@"签到记录",@"金币商城"];
    UIView *midView = [[UIView alloc]init];
    [self.view addSubview:midView];
    
    for (int i = 0; i < titleArray.count; i++) {
        
        UIView *view = [[UIView alloc]init];
        [midView addSubview:view];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = 301+i;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor orangeColor];
        button.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [view addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(30);
            make.edges.mas_offset(UIEdgeInsetsMake(0, SCREEN_WIDTH/2-50, 0, 0));
        }];
        
    }
    
    [midView.subviews mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:5 leadSpacing:10 tailSpacing:10];

    [midView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(350);
    }];
    
    UIView *mid = [[UIView alloc]init];
    [self.view addSubview:mid];
    
    for (int i = 0; i < titleArray.count; i++) {
        
        UIView *view = [[UIView alloc]init];
        [mid addSubview:view];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.backgroundColor = [UIColor orangeColor];
        button.tag = 101+i;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [view addSubview:button];
        
        UILabel *lineLabel;
        if (i != titleArray.count-1) {
            lineLabel = [[UILabel alloc]init];
            lineLabel.backgroundColor = [UIColor whiteColor];
            [view addSubview:lineLabel];
        }
        
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_offset(UIEdgeInsetsMake(0, 0, 0, -1));
        }];
        
        [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(view).offset(10);
            make.bottom.equalTo(view).offset(-10);
            make.right.equalTo(view);
            make.width.mas_equalTo(1);
        }];
    }
    
    [mid.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [mid.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        //横向
        make.top.equalTo(mid.mas_top);
        make.height.equalTo(@40);
    }];
    
    [mid mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.view);
        make.top.equalTo(midView.mas_top).offset(-50);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
