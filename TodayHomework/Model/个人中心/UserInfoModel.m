//
//  UserInfoModel.m
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "UserInfoModel.h"
//@property (nonatomic, copy) NSString *custName;
//@property (nonatomic, copy) NSString *email;
//@property (nonatomic, copy) NSString *gender;
//@property (nonatomic, copy) NSString *signature;
//@property (nonatomic, copy) NSString *mobile;
//@property (nonatomic, copy) NSString *id;
//@property (nonatomic, copy) NSString *icon;
//@property (nonatomic, copy) NSString *custType;
//@property (nonatomic, copy) NSString *custCode;
//@property (nonatomic, strong) SchoolInfoModel *schoolInfo;
//@property (nonatomic, strong) NSMutableArray *paramList;

#define UserInfoCustNameKey @"custName"
#define UserInfoEmailKey @"email"
#define UserInfoGenderKey @"gender"
#define UserInfoSignatureKey @"signature"
#define UserInfoMobileKey @"mobile"
#define UserInfoIdKey @"id"
#define UserInfoIconKey @"icon"
#define UserInfoCustTypeKey @"custType"
#define UserInfoCustCodeKey @"custCode"
#define UserInfoSchoolInfoKey @"schoolInfo"
#define UserInfoParamListKey @"paramList"

@implementation UserInfoModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_custName forKey:UserInfoCustNameKey];
    [aCoder encodeObject:_email forKey:UserInfoEmailKey];
    [aCoder encodeObject:_gender forKey:UserInfoGenderKey];
    [aCoder encodeObject:_signature forKey:UserInfoSignatureKey];
    [aCoder encodeObject:_mobile forKey:UserInfoMobileKey];
    [aCoder encodeObject:_id forKey:UserInfoIdKey];
    [aCoder encodeObject:_icon forKey:UserInfoIconKey];
    [aCoder encodeObject:_custType forKey:UserInfoCustTypeKey];
    [aCoder encodeObject:_custCode forKey:UserInfoCustCodeKey];
    [aCoder encodeObject:_schoolInfo forKey:UserInfoSchoolInfoKey];
    [aCoder encodeObject:_paramList forKey:UserInfoParamListKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _custName = [aDecoder decodeObjectForKey:UserInfoCustNameKey];
        _email = [aDecoder decodeObjectForKey:UserInfoEmailKey];
        _gender = [aDecoder decodeObjectForKey:UserInfoGenderKey];
        _signature = [aDecoder decodeObjectForKey:UserInfoSignatureKey];
        _mobile = [aDecoder decodeObjectForKey:UserInfoMobileKey];
        _id = [aDecoder decodeObjectForKey:UserInfoIdKey];
        _icon = [aDecoder decodeObjectForKey:UserInfoIconKey];
        _custType = [aDecoder decodeObjectForKey:UserInfoCustTypeKey];
        _custCode = [aDecoder decodeObjectForKey:UserInfoCustCodeKey];
        _schoolInfo = [aDecoder decodeObjectForKey:UserInfoSchoolInfoKey];
        _paramList = [aDecoder decodeObjectForKey:UserInfoParamListKey];
    }
    return self;
}

+ (NSDictionary *)objectClassInArray {
    return @{@"paramList":[ParamInfoModel class]};
}


@end
