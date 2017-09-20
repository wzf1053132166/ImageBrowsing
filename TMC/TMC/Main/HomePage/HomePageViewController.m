//
//  HomePageViewController.m
//  TMC
//
//  Created by wzf on 2017/8/14.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "HomePageViewController.h"
#import "HUDProgress.h"
#import "UpView.h"

static NSString *const GetLoginKey = @"GetLoginKey";
static NSString *const GetOutKey = @"GetOutKey";

static NSString *const GetPhotoKey = @"GetSystemPhotoKey";
static NSString *const StoreTableName = @"MineCollect";


@interface HomePageViewController ()<UIGestureRecognizerDelegate>

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@"1"];
    [array addObject:@"2"];
    
    
    //对数组进行扩展方法，这样越界不会崩溃，字典为空也不会崩溃
    NSString *str = [array objectAtCheckedIndex:3];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"wzf1"] = @"1";
    NSString *str1 = [[array objectAtCheckedIndex:3] stringForCheckedKey:@"wzf"];
    DLog(@"%@%@",str,str1);
    NSString *str2 = [dict objectForKey:@"1"];
    
    
    [MBProgressHUD show];

    //AFN代理网络请求
    [self accessToServerForGetGetLogin];
    //FMDB缓存存储
    [self loaidngDataCache];

    
    

}

//载入缓存 第一次没有缓存，第二次数据请求保存完毕之后会有
-(void)loaidngDataCache
{
    [MyAppDelegate.cacheStore createTableWithName:StoreTableName];
    
    {
        NSDictionary *dicR = [MyAppDelegate.cacheStore getObjectById:GetPhotoKey fromTable:StoreTableName];
        DLog(@"数据库缓存的数据%@", dicR);
        
    }
}

#pragma mark -- 代理网络请求
-(void)accessToServerForGetGetLogin
{
    
    NSString *url = @"http://apis.haoservice.com/lifeservice/cook/query?";
    NSMutableDictionary *postInfo = [NSMutableDictionary dictionary];
    postInfo[@"menu"] = @"土豆";
    postInfo[@"pn"] = @1;
    postInfo[@"rn"] = @"10";
    postInfo[@"key"] = @"2ba215a3f83b4b898d0f6fdca4e16c7c";
    [NetWorkRequest netWorkRequestData:post url:url parameters:postInfo requestName:GetOutKey delegate:self];
    
}


-(void)netWorkRequestSuccess:(id)data requestName:(NSString *)getRequestName parameters:(NSDictionary *)getparameters statusCode:(NSInteger)statusCode{
    NSDictionary *dicR = (NSDictionary *)data;
    if ([getRequestName isEqualToString:GetLoginKey]) {
        
        DLog(@"%@",dicR);
        
    }else if ([getRequestName isEqualToString:GetOutKey]){
        
        //DES3加密 需要和服务器商量好  gkey 和 gIv 的值 点进去可看见
        NSString *str1 = [HTDES3Util encrypt:[dicR stringForCheckedKey:@"error_code"]];
        DLog(@"加密后的字符串-------%@",str1);
        //DES3解密
        NSString *str = [HTDES3Util decrypt:str1];
        DLog(@"解密后的字符串-------%@", str);
        
        //json字串符转字典
        NSDictionary *dic = [str objectFromJSONString];
        DLog(@"服务器请求下来的数据%@", dicR);
        
        //将服务器数据写入数据库做缓存
        [MyAppDelegate.cacheStore putObject:dicR withId:GetPhotoKey intoTable:StoreTableName];
    }
}

-(void)netWorkRequestFailed:(NSError*)error requestName:(NSString *)getRequestName parameters:(NSDictionary *)getparameters statusCode:(NSInteger)statusCode{
    //服务器连接失败请重试
    DLog(@"%@",ErrorServer);
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
