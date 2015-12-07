//
//  THAPI.h
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#ifndef THAPI_h
#define THAPI_h

#define API_HOST @"http://192.16.150.213:14082/education/rest"
#define API_Picture @"http://192.16.150.213:14082/education"

/********* 登陆 **********/
#define API_LOGIN @"/cust/login/"

/******** 今日作业首页 **********/
#define API_HOMEWORK_TEACHER @"/busyworkInfo/findBusyWorkByTeacher"

/******** 获取教师所在年级 *********/
#define API_GRADE_TEACHER @"/classInfo/findClassesByTeacher"

/****** 教师获取班级的科目 **********/
#define API_CourseByClasses @"/busyworkInfo/getCommonCourse"


#endif /* THAPI_h */
