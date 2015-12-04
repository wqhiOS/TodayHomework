//
//  HomeworkHandle.h
//  TodayHomework
//
//  Created by wuqh on 15/12/4.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BaseHandle.h"

@interface HomeworkHandle : BaseHandle
+ (void)homeworkWithPage:(NSInteger)page Success:(SuccessBlock)success failed:(FailedBlock)failed;
@end
