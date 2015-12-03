//
//  UserInfoTool.m
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "UserInfoTool.h"

#define THUserInfoFileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"userInfo.data"]

@implementation UserInfoTool

static UserInfoModel *_userInfo;
+ (void)saveUserInfo:(UserInfoModel *)userInfo {
    [NSKeyedArchiver archiveRootObject:userInfo toFile:THUserInfoFileName];
}

+ (UserInfoModel *)userInfo {
    if (!_userInfo) {
        _userInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:THUserInfoFileName];
    }
    return _userInfo;
}

@end
