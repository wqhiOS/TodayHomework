	//
//  SelectSchoolViewController.h
//  TodayHomework
//
//  Created by wuqh on 15/11/29.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BaseViewController.h"


@interface SelectSchoolViewController : BaseViewController

@property (nonatomic, copy) void (^selecteSchool)(NSString *);

@end
