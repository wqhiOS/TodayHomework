//
//  HomeTableDataSource.h
//  TodayHomework
//
//  Created by wuqh on 15/12/4.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HomeworkStatusModel;
@protocol HomeViewDelegate <NSObject>

@required
- (void)homeWorkPushHomeDetailPage:(HomeworkStatusModel *)status;
- (void)homeWorkPushCheckSituationPage:(HomeworkStatusModel *)status;

@end

@interface HomeTableDataSource : NSObject<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) id<HomeViewDelegate> delegate;
- (instancetype)initWithTableView:(UITableView *)tableView;
- (void)reloadTable:(NSMutableArray *)dataArr;
@end
