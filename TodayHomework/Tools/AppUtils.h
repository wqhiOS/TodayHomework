//
//  AppUtils.h
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUtils : NSObject

/*********************** Format date **********************/

+ (NSDate *)dateFromString:(NSString *)dateString formatter:(NSString *)formatter;
+(NSString *)stringFromDate:(NSDate *)date;
//日期得星期
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;
+ (NSString *)currentDate;

@end
