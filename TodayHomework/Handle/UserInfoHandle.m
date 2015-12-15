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
#import "NSString+Gen_uuid.h"


@implementation UserInfoHandle

+ (void)loginWthLoginName:(NSString *)loginName andPassword:(NSString *)password success:(SuccessBlock)success failed:(FailedBlock)failed {
    
    NSString *url = [API_HOST stringByAppendingString:API_LOGIN];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"loginName"] = loginName;
    params[@"loginPassword"] = password;
    [[WUHttpClient defaultClient] requestWithPath:url method:WUHttpRequestPost parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {

        if ([responseObject[@"code"] integerValue] == 0) {
            UserInfoModel *userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject[@"data"]];
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
    
    [SVProgressHUD show];
    
    NSString*url=[API_HOST stringByAppendingString:API_GRADE_TEACHER];
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"teachId"] = [[UserInfoTool userInfo] id];
    params[@"page"] = @"0";
    params[@"size"] = @"10";
    [[WUHttpClient defaultClient] requestWithPath:url method:WUHttpRequestGet parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            NSMutableArray *classes = @[].mutableCopy;
            for (NSDictionary *dict in responseObject[@"data"]) {
                ClassInfoModel *classInfo = [ClassInfoModel mj_objectWithKeyValues:dict];
                [classes addObject:classInfo];
            }
            if (success) {
                [SVProgressHUD dismiss];
                success(classes);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

+ (void)subjectsByClasses:(NSString *)classesId Success:(SuccessBlock)success failed:(FailedBlock)failed {
    
    [SVProgressHUD show];
    NSString *url = [API_HOST stringByAppendingString:API_CourseByClasses];
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"classIds"] = classesId;
    params[@"teacherId"] = [[UserInfoTool userInfo] id];
    [[WUHttpClient defaultClient] requestWithPath:url method:WUHttpRequestPost parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        if (success) {
            NSDictionary *dict = [NSDictionary dictionaryWithObjects:[responseObject[@"data"] allKeys] forKeys:[responseObject[@"data"] allValues]];
            success(dict);
            [SVProgressHUD dismiss];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

+ (void)publishHomework:(NSString *)classesId startDate:(NSString *)startDate endDate:(NSString *)endDate courseId:(NSString *)courseId memo:(NSString *)memo attachments:(NSArray *)attachments success:(SuccessBlock)success failed:(FailedBlock)failed {
    
    NSString *url = [API_HOST stringByAppendingString:API_PUBLISH_HOMEWORK];
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"custId"] = [UserInfoTool userInfo].id;
    params[@"classesId"] = classesId;
    params[@"startDate"] = startDate;
    params[@"endDate"] = endDate;
    params[@"courseId"] = courseId;
    params[@"memo"] = memo;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"from"];
    manager.requestSerializer.timeoutInterval = 60.f;
    [manager.requestSerializer setValue:CurrentVersion forHTTPHeaderField:@"version"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"multipart/form-data", @"text/html",@"text/json",@"text/javascript", nil];
  
    
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        for (int i=0; i<attachments.count; i++) {
            UIImage *image = attachments[i];
            NSData *data = UIImageJPEGRepresentation(image, 0.1);
           
            [formData appendPartWithFileData:data name:[NSString gen_uuid] fileName:[NSString stringWithFormat:@"%@.jpg",[NSString gen_uuid]] mimeType:@"image/jpg"];
        }
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject[@"message"]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

}


+ (void)updateSubjectsBySubjectsId:(NSString *)subjectsId oldSubjectsId:(NSString *)oldSubjectsId classId:(NSString *)classId success:(SuccessBlock)success failed:(FailedBlock)failed {
    
    NSString *url = [API_HOST stringByAppendingString:API_UPDATE_SUBJECTS];
    NSMutableDictionary *params = @{}.mutableCopy;
    
    params[@"classesId"] = classId;
    params[@"custId"] = [[UserInfoTool userInfo] id];
    params[@"cours"] = subjectsId;
    params[@"oldcours"] = oldSubjectsId;
    
    [[WUHttpClient defaultClient] requestWithPath:url method:WUHttpRequestPost parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([responseObject[@"code"] integerValue] == 0) {
            if (success) {
                success(responseObject[@"message"]);
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        
    }];
    
    
}

+ (void)classStudentsInfo:(NSString *)classId success:(SuccessBlock)success failed:(FailedBlock)failed {
    
    NSString *url = [API_HOST stringByAppendingString:API_CLASS_SUTDENTSINFO];
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"id"] = classId;
    
    [[WUHttpClient defaultClient] requestWithPath:url method:WUHttpRequestGet parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            if (success) {
                
                NSArray *students = [UserInfoModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
                success(students);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}


@end
