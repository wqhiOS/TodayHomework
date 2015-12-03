//
//  UserInfoHandle.h
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseHandle.h"

@interface UserInfoHandle : BaseHandle

/**
 *  用户登陆
 *
 *  @param loginName 登陆名
 *  @param password  密码
 */
+ (void)loginWthLoginName:(NSString *)loginName andPassword:(NSString *)password success:(SuccessBlock)success failed:(FailedBlock)failed;

@end
