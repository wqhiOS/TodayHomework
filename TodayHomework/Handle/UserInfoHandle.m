//
//  UserInfoHandle.m
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "UserInfoHandle.h"
#import "WUHttpClient.h"
#import "THAPI.h"
#import "UserInfoModel.h"
#import <MJExtension.h>

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

@end
