//
//  HomeworkDeleteButton.h
//  TodayHomework
//
//  Created by wuqh on 15/12/9.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeworkDeleteButton : UIButton

@property (nonatomic, copy) void (^deleteHomework)(HomeworkDeleteButton *);

@end
