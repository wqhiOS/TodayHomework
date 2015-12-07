//
//  ClassesInfoModel.h
//  TodayHomework
//
//  Created by wuqh on 15/12/4.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BaseModel.h"

@interface ClassesInfoModel : BaseModel
@property (nonatomic, copy) NSString *classedId;
@property (nonatomic, copy) NSString *gradeId;
@property (nonatomic, copy) NSString *educationStage;
@property (nonatomic, copy) NSString *educationYear;
@end
