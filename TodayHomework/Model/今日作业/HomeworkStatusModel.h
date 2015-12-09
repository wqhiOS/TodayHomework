//
//  HomeworkStatusModel.h
//  TodayHomework
//
//  Created by wuqh on 15/12/4.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BaseModel.h"
#import "HomeworkModel.h"
#import "ClassesInfoModel.h"

@interface HomeworkStatusModel : BaseModel

@property (nonatomic, strong) HomeworkModel *busyworkInfo;
@property (nonatomic, strong) ClassesInfoModel *classesInfo;
@property (nonatomic, strong) NSNumber *classStudentTotla;
/**
 *  答案附件
 */
@property (nonatomic, strong) NSArray *listAttachmentInfoANSWER;
/**
 *  作业附件
 */
@property (nonatomic, strong) NSArray *listAttachmentInfowork;
@property (nonatomic, assign) BOOL isEnd;



@end
