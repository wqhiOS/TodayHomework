//
//  HomeTableDataSource.h
//  TodayHomework
//
//  Created by wuqh on 15/12/4.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeTableDataSource : NSObject<UITableViewDataSource,UITableViewDelegate>
- (instancetype)initWithTableView:(UITableView *)tableView;

- (void)reloadTable:(NSMutableArray *)dataArr;
@end
