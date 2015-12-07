//
//  HomeworkStatusModel.m
//  TodayHomework
//
//  Created by wuqh on 15/12/4.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "HomeworkStatusModel.h"
#import "AppUtils.h"
#import "AnswerInfoModel.h"

@implementation HomeworkStatusModel

- (void)setBusyworkInfo:(HomeworkModel *)busyworkInfo {
    _busyworkInfo = busyworkInfo;
    
    NSDate *endDate = [AppUtils dateFromString:busyworkInfo.endDate formatter:@"yyyy-MM-dd"];
    NSDate *nowDate = [AppUtils dateFromString:[AppUtils currentDate] formatter:@"yyyy-MM-dd"];
    _isEnd = [endDate timeIntervalSinceDate:nowDate] >=0 ? NO : YES;
}

+ (NSDictionary *)objectClassInArray {
    return @{@"listAttachmentInfoANSWER":[AnswerInfoModel class]};
}
@end
