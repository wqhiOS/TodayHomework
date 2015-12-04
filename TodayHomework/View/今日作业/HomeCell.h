//
//  HomeCell.h
//  TodayHomework
//
//  Created by wuqh on 15/12/4.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeworkStatusModel.h"

@interface HomeCell : UITableViewCell

@property (nonatomic, copy) void(^homeworkDetailBlock)(void);
@property (nonatomic, copy) void(^checkHomeworkSituation)(void);

@property (nonatomic, strong) HomeworkStatusModel *status;

@end
