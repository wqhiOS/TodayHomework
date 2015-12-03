//
//  SchoolInfoModel.h
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BaseModel.h"

@interface SchoolInfoModel : BaseModel<NSCoding>

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *detailAddress;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *county;
@property (nonatomic, copy) NSString *recordStatus;
@property (nonatomic, copy) NSString *schoolCode;
@property (nonatomic, copy) NSString *schoolName;
@property (nonatomic, copy) NSString *zipCode;

@end
