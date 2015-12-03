//
//  SchoolInfoModel.m
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "SchoolInfoModel.h"

#define SchoolInfoIdKey @"id"
#define SchoolInfoCityKey @"city"
#define SchoolInfoDetailAddressKey @"detailAddress"
#define SchoolInfoProvinceKey @"province"
#define SchoolInfoCountyKey @"county"
#define SchoolInfoRecordStatusKey @"schoolInfoRecordStatusKey"
#define SchoolInfoSchoolCodeKey @"schoolInfoCode"
#define SchoolInfoSchoolNameKey @"schoolName"
#define SchoolInfoZipCodeKey @"zipCode"

@implementation SchoolInfoModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_id forKey:SchoolInfoIdKey];
    [aCoder encodeObject:_city forKey:SchoolInfoCityKey];
    [aCoder encodeObject:_detailAddress forKey:SchoolInfoDetailAddressKey];
    [aCoder encodeObject:_province forKey:SchoolInfoProvinceKey];
    [aCoder encodeObject:_county forKey:SchoolInfoCountyKey];
    [aCoder encodeObject:_recordStatus forKey:SchoolInfoRecordStatusKey];
    [aCoder encodeObject:_schoolCode forKey:SchoolInfoSchoolCodeKey];
    [aCoder encodeObject:_schoolName forKey:SchoolInfoSchoolNameKey];
    [aCoder encodeObject:_zipCode forKey:SchoolInfoZipCodeKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _id = [aDecoder decodeObjectForKey:SchoolInfoIdKey];
        _city = [aDecoder decodeObjectForKey:SchoolInfoCityKey];
        _detailAddress = [aDecoder decodeObjectForKey:SchoolInfoDetailAddressKey];
        _province = [aDecoder decodeObjectForKey:SchoolInfoProvinceKey];
        _county = [aDecoder decodeObjectForKey:SchoolInfoCountyKey];
        _recordStatus = [aDecoder decodeObjectForKey:SchoolInfoRecordStatusKey];
        _schoolCode = [aDecoder decodeObjectForKey:SchoolInfoSchoolCodeKey];
        _schoolName = [aDecoder decodeObjectForKey:SchoolInfoSchoolNameKey];
        _zipCode = [aDecoder decodeObjectForKey:SchoolInfoZipCodeKey];
    }
    return self;
}

@end
