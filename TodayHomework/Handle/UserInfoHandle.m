//
//  UserInfoHandle.m
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "UserInfoHandle.h"

#import "UserInfoModel.h"
#import "ClassInfoModel.h"


@implementation UserInfoHandle

+ (void)loginWthLoginName:(NSString *)loginName andPassword:(NSString *)password success:(SuccessBlock)success failed:(FailedBlock)failed {
    
    NSString *url = [API_HOST stringByAppendingString:API_LOGIN];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"loginName"] = loginName;
    params[@"loginPassword"] = password;
    [[WUHttpClient defaultClient] requestWithPath:url method:WUHttpRequestPost parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {

        if ([responseObject[@"code"] integerValue] == 0) {
            UserInfoModel *userInfo = [UserInfoModel objectWithKeyValues:responseObject[@"data"]];
            if (success) {
                success(userInfo);
            }
        }else {
            if (failed) {
                failed(responseObject);
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
}

+ (void)classesByTeacerSuccess:(SuccessBlock)success failed:(FailedBlock)failed {
    NSString*url=[API_HOST stringByAppendingString:API_GRADE_TEACHER];
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"teachId"] = [[UserInfoTool userInfo] id];
    params[@"page"] = @"0";
    params[@"size"] = @"10";
    [[WUHttpClient defaultClient] requestWithPath:url method:WUHttpRequestGet parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            NSMutableArray *classes = @[].mutableCopy;
            for (NSDictionary *dict in responseObject[@"data"]) {
                ClassInfoModel *classInfo = [ClassInfoModel objectWithKeyValues:dict];
                [classes addObject:classInfo];
            }
            if (success) {
                success(classes);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

+ (void)subjectsByClasses:(NSString *)classesId Success:(SuccessBlock)success failed:(FailedBlock)failed {
    NSString *url = [API_HOST stringByAppendingString:API_CourseByClasses];
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"classIds"] = classesId;
    params[@"teacherId"] = [[UserInfoTool userInfo] id];
    [[WUHttpClient defaultClient] requestWithPath:url method:WUHttpRequestPost parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            NSDictionary *dict = [NSDictionary dictionaryWithObjects:[responseObject[@"data"] allKeys] forKeys:[responseObject[@"data"] allValues]];
            success(dict);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
@end
