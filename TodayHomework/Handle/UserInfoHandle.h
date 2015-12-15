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


/**
 *  发布作业
 *
 *  @param classesId   班级拼接id
 *  @param startDate   作业开始时间
 *  @param endDate     作业结束时间
 *  @param courseId    科目id
 *  @param memo        作业内容
 *  @param attachments 附件
 */
+ (void)publishHomework:(NSString *)classesId
              startDate:(NSString *)startDate
                endDate:(NSString *)endDate
               courseId:(NSString *)courseId
                   memo:(NSString *)memo
            attachments:(NSArray *)attachments
                success:(SuccessBlock)success
                 failed:(FailedBlock)failed;

/**
 *  教师更改班级所教科目
 *
 *  @param subjectsId    更改后的科目拼接id
 *  @param oldSubjectsId 更改前的科目拼接id
 *  @param classId       班级id
 */
+ (void)updateSubjectsBySubjectsId:(NSString *)subjectsId
                     oldSubjectsId:(NSString *)oldSubjectsId
                           classId:(NSString *)classId
                           success:(SuccessBlock)success
                            failed:(FailedBlock)failed ;

/**
 *  教师获取某班级所有学生信息
 *
 *  @param classId 班级id
 */
+ (void)classStudentsInfo:(NSString *)classId
                  success:(SuccessBlock)success
                   failed:(FailedBlock)failed;

@end
