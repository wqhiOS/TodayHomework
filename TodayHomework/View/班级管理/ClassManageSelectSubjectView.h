//
//  ClassManageSelectSubjectView.h
//  TodayHomework
//
//  Created by wuqh on 15/12/11.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassManageSelectSubjectView : UIView

/**
 *  旧的选中科目(数据未处理)
 */
@property (nonatomic, strong) NSArray *subjects;
/**
 *  旧的选中科目(数据已处理)
 */
@property (nonatomic, strong) NSMutableDictionary *subjectsDict;
/**
 *  教师所教的所有科目
 */
@property (nonatomic, strong) NSDictionary *teacherSubjects;
/**
 *  新的选中的科目拼接字符串
 */
@property (nonatomic, copy, readonly) NSString *selectedSubjectsId;



- (void)setTeacherSubjects:(NSDictionary *)teacherSubjects selectedSubjects:(NSArray *)selectedSubjects;


@end
