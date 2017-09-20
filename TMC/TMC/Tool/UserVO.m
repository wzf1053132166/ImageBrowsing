//
//  WCUserInfo.m
//  WeChat
//
//  Created by apple on 14/12/8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "UserVO.h"
#import "Const.h"

static UserVO *instanceOfUserInfo;


@implementation UserVO


+ (UserVO *)userInfo
{
    @synchronized(self)
    {
        if (instanceOfUserInfo == nil)
        {
            instanceOfUserInfo = [CommonAPI getObject:kMyUserVOKey];
            if (!instanceOfUserInfo) {
                instanceOfUserInfo = [[self alloc] init];
            }
        }
        return instanceOfUserInfo;
    }
    
    return nil;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    //for auto login
    [aCoder encodeObject:self.strUid forKey:@"driverid"];
    [aCoder encodeObject:self.strNickName forKey:@"name"];
    [aCoder encodeObject:self.strHeadImage forKey:@"head_image"];
    [aCoder encodeObject:self.strAgentsum forKey:@"agentsum"];
    [aCoder encodeObject:self.strMobile forKey:@"phone"];
    [aCoder encodeObject:[NSNumber numberWithBool:self.loginStatus] forKey:@"loginStatus"];
    [aCoder encodeObject:self.age forKey:@"driving_years"];
    [aCoder encodeObject:self.strAvglevel forKey:@"avglevel"];
    [aCoder encodeObject:self.strToken forKey:@"token"];
    [aCoder encodeObject:self.userType forKey:@"user_type"];
    
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        
        self.strUid = [aDecoder decodeObjectForKey:@"driverid"];
        self.strNickName = [aDecoder decodeObjectForKey:@"name"];
        
        self.strHeadImage = [aDecoder decodeObjectForKey:@"head_image"];
        
        self.strMobile = [aDecoder decodeObjectForKey:@"phone"];
        
        self.age = [aDecoder decodeObjectForKey:@"driving_years"];
        

        self.loginStatus = [[aDecoder decodeObjectForKey:@"loginStatus"] boolValue];
        self.strAgentsum = [aDecoder decodeObjectForKey:@"agentsum"];
        
        self.strAvglevel = [aDecoder decodeObjectForKey:@"avglevel"];
        self.strToken = [aDecoder decodeObjectForKey:@"token"];
        self.userType = [aDecoder decodeObjectForKey:@"user_type"];
    }
    return self;
}




- (void)regitserUserInfo:(NSDictionary*)aDicJson
{
    [self cleanUserInfo];
    
    self.strUid = [aDicJson stringForCheckedKey:@"driverid"];
    self.strNickName = [aDicJson stringForCheckedKey:@"name"];
    self.strHeadImage = [aDicJson stringForCheckedKey:@"head_image"];
    self.strMobile = [aDicJson stringForCheckedKey:@"phone"];
    self.strAgentsum = [aDicJson stringForCheckedKey:@"agentsum"];
    self.strAvglevel = [aDicJson stringForCheckedKey:@"avglevel"];
    self.age = [aDicJson stringForCheckedKey:@"driving_years"];
    self.strToken = [aDicJson stringForCheckedKey:@"token"];
    self.userType = [aDicJson stringForCheckedKey:@"user_type"];
}



-(void)saveUserInfo{

    [CommonAPI store:self to:kMyUserVOKey];
}

-(void)cleanUserInfo
{
   
    self.strUid = @"";
    self.strNickName = @"";
    self.strHeadImage = @"";
    self.strMobile = @"";
    self.strAgentsum = @"";
    self.strAvglevel = @"";
    self.strToken = @"";
    self.userType = @"";
    self.loginStatus = NO;
    
  
    
    
}



@end
