//
//  UserInfoTool.h
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserInfoModel.h"
@interface UserInfoTool : NSObject

+ (void)saveUserInfo:(UserInfoModel *)userInfo;
+ (UserInfoModel *)userInfo;

@end
