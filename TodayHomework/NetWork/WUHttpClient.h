//
//  WUHttpClient.h
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking.h>

typedef NS_ENUM(NSInteger, WUHttpRequestType){
    WUHttpRequestGet,
    WUHttpRequestPost,
};

@interface WUHttpClient : NSObject


+ (WUHttpClient *)defaultClient;

/**
 *  http请求
 *
 *  @param url
 *  @param method     get post
 *  @param parameters 参数
 *  @param success    成功的回掉
 *  @param failure    失败的回掉
 */
- (void)requestWithPath:(NSString *)url
                 method:(WUHttpRequestType)method
             parameters:(id)parameters
                success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success
                failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure;


/**
 *  判断当前网络状态
 *
 *  @return
 */
- (BOOL)isConnectionAvailable;


@end
