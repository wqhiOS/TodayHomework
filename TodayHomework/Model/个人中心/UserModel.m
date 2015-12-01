//
//  UserModel.m
//  TodayHomework
//
//  Created by wuqh on 15/12/1.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "UserModel.h"

#define UserModelClassesKey @"classes"
#define UserModelAccessTokenKey @"access_token"

@implementation UserModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_classes forKey:UserModelClassesKey];
    [aCoder encodeObject:_access_token forKey:UserModelAccessTokenKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _classes = [aDecoder decodeObjectForKey:UserModelClassesKey];
        _access_token = [aDecoder decodeObjectForKey:UserModelAccessTokenKey];
    }
    return self;
}

@end
