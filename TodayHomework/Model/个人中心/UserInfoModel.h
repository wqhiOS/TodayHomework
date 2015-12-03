//
//  UserInfoModel.h
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BaseModel.h"
#import "SchoolInfoModel.h"
#import "ParamInfoModel.h"

@interface UserInfoModel : BaseModel<NSCoding>

@property (nonatomic, copy) NSString *custName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *signature;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *custType;
@property (nonatomic, copy) NSString *custCode;
@property (nonatomic, strong) SchoolInfoModel *schoolInfo;
@property (nonatomic, strong) NSMutableArray *paramList;

@end
