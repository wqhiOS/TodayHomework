//
//  PublishHomeworkHeaderView.h
//  TodayHomework
//
//  Created by wuqh on 15/12/8.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>
@class THSubmitButton;
@interface PublishHomeworkHeaderView : UIView

@property (nonatomic, copy) void (^publishHomework) (THSubmitButton *);

@end
