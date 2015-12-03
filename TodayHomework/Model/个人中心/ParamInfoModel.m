//
//  ParamInfoModel.m
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "ParamInfoModel.h"

#define ParamInfoIdKey @"id"
#define ParamInfoNameKey @"paramName"

@implementation ParamInfoModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_id forKey:ParamInfoIdKey];
    [aCoder encodeObject:_paramName forKey:ParamInfoNameKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _id  = [aDecoder decodeObjectForKey:ParamInfoIdKey];
        _paramName = [aDecoder decodeObjectForKey:ParamInfoNameKey];
    }
    return self;
}

@end
