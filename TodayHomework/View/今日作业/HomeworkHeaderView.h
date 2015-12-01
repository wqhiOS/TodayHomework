//
//  HomeworkHeaderView.h
//  TodayHomework
//
//  Created by wuqh on 15/12/1.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HomeworkHeaderViewClickBlockType)(void);

@interface HomeworkHeaderView : UIView

@property (nonatomic, copy) HomeworkHeaderViewClickBlockType personalCenterBlock;
@property (nonatomic, copy) HomeworkHeaderViewClickBlockType publishHomeworkBlock;
@property (nonatomic, copy) HomeworkHeaderViewClickBlockType HomeworkManageBlock;

+ (instancetype)homeworkHeaderView;

@end
