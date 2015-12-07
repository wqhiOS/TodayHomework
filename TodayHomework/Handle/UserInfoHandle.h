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

/**
 *  获得教师加入的所有班级
 *
 */
+ (void)classesByTeacerSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

/**
 *  获得教师所教班级的科目
 *
 */
+ (void)subjectsByClasses:(NSString *)classesId Success:(SuccessBlock)success failed:(FailedBlock)failed;

@end
