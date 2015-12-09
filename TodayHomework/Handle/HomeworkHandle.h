//
//  HomeworkHandle.h
//  TodayHomework
//
//  Created by wuqh on 15/12/4.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BaseHandle.h"

@interface HomeworkHandle : BaseHandle
/**
 *  教师获取作业
 *
 *  @param page    分页页码
 */
+ (void)homeworkWithPage:(NSInteger)page Success:(SuccessBlock)success failed:(FailedBlock)failed;

/**
 *  教师删除作业
 *
 *  @param homeworkIds 所删除的作业id
 */
+ (void)deleteHomework:(NSString *)homeworkIds success:(SuccessBlock)success failed:(FailedBlock)failed;
@end
