//
//  BaseHandle.h
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WUHttpClient.h"
#import "THAPI.h"
#import <MJExtension.h>
#import "UserInfoTool.h"
#import <SVProgressHUD.h>

/**
 *  Handler处理成功时调用的Block
 *  @param obj 为客户端需要的数据
 */
typedef void (^SuccessBlock)(id obj);

/**
 *  Handler处理失败时调用的Block
 *  @param obj 为错误信息
 */
typedef void (^FailedBlock)(id obj);

@interface BaseHandle : NSObject

@end
