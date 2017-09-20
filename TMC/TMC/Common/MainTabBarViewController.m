//
//  MainTabBarViewController.m
//  demo
//
//  Created by macbook on 16/6/4.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "HWTabBar.h"
#import "FMNavigationController.h"

#import "HomePageViewController.h"
#import "HotelViewController.h"
#import "AirTicketsViewController.h"
#import "MineViewController.h"


@interface MainTabBarViewController ()
{
    HomePageViewController *HomePageVC;
    HotelViewController *HotelVC;
    AirTicketsViewController *AirTicketsVC;
    MineViewController *MineVC;
    
    HWTabBar *tabBar;
}
@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];

    // 初始化tabbar
    [self setupTabbar];
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
   
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showBadge) name:BadgeShowNotifaction object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hiddenBadge) name:BadgeHiddenNotifaction object:nil];
    
    
}

- (void)showBadge{
    
    [self showBadgeOnItemIndex:2 tabar:tabBar num:4];
}

- (void)hiddenBadge{
    
    [self removeBadgeOnItemIndex:2 tabar:tabBar num:4];
    
}

#pragma mark - Init

- (void)setupTabbar
{
    tabBar = [[HWTabBar alloc] init];
    tabBar.backgroundColor = [UIColor clearColor];
    tabBar.itemPositioning = UITabBarItemPositioningFill;
    [self setValue:tabBar forKeyPath:@"tabBar"];
}

- (void)showBadgeOnItemIndex:(int)index tabar:(UITabBar *)tabar num:(int)num{
    
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index tabar:tabar num:num];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + index;
    badgeView.backgroundColor = [UIColor redColor];
    CGRect tabFrame = tabar.frame;
    
    //确定小红点的位置
    float percentX = (index +0.6) / num;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 8, 8);
    badgeView.layer.cornerRadius = badgeView.frame.size.width/2;
    
    [tabar addSubview:badgeView];
    
}

-(void)dealloc{
    FM_DEALLOC();
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)hideBadgeOnItemIndex:(int)index tabar:(UITabBar *)tabar num:(int)num{
    
    //移除小红点
    [self removeBadgeOnItemIndex:index tabar:tabar num:num];
    
}

- (void)removeBadgeOnItemIndex:(int)index tabar:(UITabBar *)tabar num:(int)num{
    
    //按照tag值进行移除
    for (UIView *subView in tabar.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}

/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    
    HomePageVC = [[HomePageViewController alloc] init];
    [self addChildVc:HomePageVC title:@"主页" image:@"home" selectedImage:@"home_selected"];
    HomePageVC.tabBarItem.tag = 1000;
    
    HotelVC = [[HotelViewController alloc] init];
        [self addChildVc:HotelVC title:@"酒店" image:@"hotel" selectedImage:@"hotel_selected"];
    HotelVC.tabBarItem.tag = 1001;
    
    AirTicketsVC = [[AirTicketsViewController alloc] init];
    [self addChildVc:AirTicketsVC title:@"机票" image:@"plane" selectedImage:@"plane_selected"];
    AirTicketsVC.tabBarItem.tag = 1002;
    
    MineVC = [[MineViewController alloc]init];
    [self addChildVc:MineVC title:@"我的" image:@"my" selectedImage:@"my_selected"];
    MineVC.tabBarItem.tag = 1003;
    
   
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
//    if (IS_IPHONE_6P) {
//        childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0);
//    }else{
//        childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
//    }
    
    
    if (IS_IOS7) {
        childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
        childVc.tabBarItem.image = [UIImage imageNamed:image];
    }
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    [childVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];//调整tababritem的标题位置
    FMNavigationController *nav = [[FMNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
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
