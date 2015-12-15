//
//  HomeworkHandle.m
//  TodayHomework
//
//  Created by wuqh on 15/12/4.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "HomeworkHandle.h"
#import "HomeworkStatusModel.h"
#import <SVProgressHUD.h>

@implementation HomeworkHandle


+ (void)homeworkWithPage:(NSInteger)page Success:(SuccessBlock)success failed:(FailedBlock)failed {
    
    
    NSString *url = [API_HOST stringByAppendingString:API_HOMEWORK_TEACHER];
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"teacherId"] = [UserInfoTool userInfo].id;
    params[@"page"] = [NSString stringWithFormat:@"%ld",page];
    params[@"size"] = @"10";
    [[WUHttpClient defaultClient] requestWithPath:url method:WUHttpRequestGet parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *dataArr = @[].mutableCopy;
      
        for (NSDictionary *dict in responseObject[@"data"][@"content"]) {
            HomeworkStatusModel *status = [HomeworkStatusModel mj_objectWithKeyValues:dict];
            [dataArr addObject:status];
        }
        if (success) {
            success(dataArr);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

+ (void)deleteHomework:(NSString *)homeworkIds success:(SuccessBlock)success failed:(FailedBlock)failed {
    
    NSString *url = [API_HOST stringByAppendingString:API_DELETE_HOMEWORK];
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"busyWorkIds"] = homeworkIds;
    [[WUHttpClient defaultClient] requestWithPath:url method:WUHttpRequestPost parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            if (success) {
                success(responseObject[@"message"]);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    
}
@end
