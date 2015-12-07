//
//  ClassInfoModel.h
//  TodayHomework
//
//  Created by wuqh on 15/12/7.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BaseModel.h"

@interface ClassInfoModel : BaseModel
/**
 *  老师所教班级的科目
 */
@property (nonatomic, strong) NSArray *teachersource;
/**
 *  年级名称
 */
@property (nonatomic, copy) NSString *gradeId;
/**
 *  学制名称
 */
@property (nonatomic, copy) NSString *educationYear;
/**
 *  小学/初中/高中
 */
@property (nonatomic, copy) NSString *educationStage;
/**
 *  班级id
 */
@property (nonatomic, copy) NSString *id;
/**
 *  班级名称
 */
@property (nonatomic, copy) NSString *classedId;
/**
 *  教该班级的老师总数量
 */
@property (nonatomic, strong) NSNumber *teacherTotal;
//"teachersource": [
//                  "1-语文",
//                  "9-物理"
//                  ],
//"gradeId": "一年级",
//"educationYear": "五年制",
//"memo": null,
//"lastUpdateUser": null,
//"recordStatus": null,
//"version": 0,
//"lastUpdateDate": 1448677520308,
//"educationStage": "小学",
//"id": "dc560b7e-af2a-4e46-95ce-cfd6ac9f145a",
//"createUser": null,
//"classedId": "2班",
//"teacherTotal": 1,
//"peopleUpperLimit": null,
//"createDate": 1448677520308,
//"studentTotal": 0
@end
