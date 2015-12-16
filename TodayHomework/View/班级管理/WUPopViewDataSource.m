//
//  WUPopTableViewDataSource.m
//  TodayHomework
//
//  Created by wuqh on 15/12/15.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "WUPopViewDataSource.h"

//@"icon_xsgl_03",@"ios-1_06",@"icon_xsgl_08",@"icon_xsgl_11",@"icon_xsgl_15"
//@"添加学生",@"删除学生",@"修改学生密码",@"下载学生信息",@"修改学生联系电话"
@interface WUPopViewDataSource()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation WUPopViewDataSource

- (instancetype)initWithTableView:(UITableView *)tableView {
    if (self = [super init]) {
        self.tableView = tableView;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    }
    return self;
}

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = @[@{@"title":@"添加学生",@"img":@"icon_xsgl_03"}
                     ,@{@"title":@"删除学生",@"img":@"ios-1_06"}
                     ,@{@"title":@"修改学生密码",@"img":@"icon_xsgl_08"}
                     ,@{@"title":@"下载学生信息",@"img":@"icon_xsgl_11"}
                     ,@{@"title":@"修改学生联系电话",@"img":@"icon_xsgl_15"}];
    }
    return _dataArr;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
//    cell.imageView.image = [UIImage imageNamed:self.dataArr[indexPath.row][@"img"]];
//    cell.textLabel.backgroundColor = [UIColor yellowColor];
//    cell.textLabel.text = self.dataArr[indexPath.row][@"title"];
//    cell.backgroundColor = [UIColor purpleColor];
//    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
//    view.backgroundColor = [UIColor purpleColor];
//    [cell.contentView addSubview:view];
//    
//  
//    NSLog(@"%@",NSStringFromCGRect(cell.frame));
    cell.textLabel.text = @"12opi9hdfiobnsiodfgh";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
