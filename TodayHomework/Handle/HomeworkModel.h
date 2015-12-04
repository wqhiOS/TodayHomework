//
//  HomeworkModel.h
//  TodayHomework
//
//  Created by wuqh on 15/12/4.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BaseModel.h"

@interface HomeworkModel : BaseModel

@property (nonatomic, copy) NSString *busyworkMessage;
@property (nonatomic, copy) NSString *busyworkStatus;
@property (nonatomic, copy) NSString *startDate;
@property (nonatomic, copy) NSString *endDate;
@property (nonatomic, copy) NSString *courseId;

@end
