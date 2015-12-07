//
//  HomeTableDataSource.m
//  TodayHomework
//
//  Created by wuqh on 15/12/4.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "HomeTableDataSource.h"
#import "HomeCell.h"

@interface HomeTableDataSource()
{
    NSArray *_dataArr;
    UITableView *_tableView;
}

@end

@implementation HomeTableDataSource

static NSString *cellId = @"HomeCellId";
- (instancetype)initWithTableView:(UITableView *)tableView {
    if (self = [super init]) {
        _tableView = tableView;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeCell class]) bundle:nil] forCellReuseIdentifier:cellId];
    }
    return self;
}

- (void)reloadTable:(NSMutableArray *)dataArr {
    _dataArr = dataArr;
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.status = _dataArr[indexPath.row];
    cell.checkHomeworkSituation = ^ {
        
    };
    return cell;
}

#pragma mark - UITableViewDelegate 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110.f;
}

@end
