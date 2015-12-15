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

/**
 *  姓名
 */
@property (nonatomic, copy) NSString *custName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *signature;
/**
 *  手机号
 */
@property (nonatomic, copy) NSString *mobile;
/**
 *  id
 */
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *custType;
@property (nonatomic, copy) NSString *custCode;
/**
 *  登陆名
 */
@property (nonatomic, copy) NSString *loginName;
/**
 *  登陆密码
 */
@property (nonatomic, copy) NSString *loginPassword;
@property (nonatomic, strong) SchoolInfoModel *schoolInfo;
@property (nonatomic, strong) NSMutableArray *paramList;


@end
