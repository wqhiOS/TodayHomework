//
//  WUHttpClient.m
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "WUHttpClient.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>
@interface WUHttpClient()
{
    BOOL _isAlertShow;
}
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

@end

@implementation WUHttpClient

+ (WUHttpClient *)defaultClient {
    static WUHttpClient *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WUHttpClient alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        
        self.manager = [AFHTTPRequestOperationManager manager];
//        //相应设置为 data
//        self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        //请求设置为 json
//        [self.manager.requestSerializer setValue:@"text/plain" forHTTPHeaderField:@"content-type"];
        
        self.manager.requestSerializer=[AFJSONRequestSerializer serializer];
        [self.manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"from"];
        [self.manager.requestSerializer setValue:CurrentVersion forHTTPHeaderField:@"version"];
        
    }
    return self;
}

- (void)requestWithPath:(NSString *)url method:(WUHttpRequestType)method parameters:(id)parameters success:(void (^)(AFHTTPRequestOperation *, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure {

    if ([self isConnectionAvailable]) {
        _isAlertShow = NO;
        switch (method) {
            case WUHttpRequestGet:
            {
                
                [self.manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    if (success) {
                        success(operation, responseObject);
                    }
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    if (failure) {
                        failure(operation,error);
                    }
                }];
            }
                break;
            case WUHttpRequestPost:
            {
                
                [self.manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    if (success) {
                        success(operation, responseObject);
                    }
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    if (failure) {
                        failure(operation, error);
                    }
                }];
            }
                break;
                
                
            default:
                break;
        }
    }else {
        if (!_isAlertShow) {
            _isAlertShow = YES;
            [self showExceptionDialog];
        }
    }
}

- (BOOL)isConnectionAvailable {
    //创建零地址，0.0.0.0的地址表示查询本机的网络连接状态
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    //获得连接的标志
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    //如果不能获取连接标志，则不能连接网络，直接返回
    if (!didRetrieveFlags)
    {
        NSLog(@"Error. Could not recover network reachability flags");
        return NO;
    }
    //根据获得的连接标志进行判断
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}

- (void)showExceptionDialog
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[[UIAlertView alloc] initWithTitle:@"提个醒"
                                    message:@"连网失败，请检查"
                                   delegate:nil
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil] show];
    });
}


@end
