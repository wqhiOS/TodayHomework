//
//  HomeViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeworkHeaderView.h"
#import "PublishHomeworkViewController.h"
#import "HomeTableDataSource.h"
#import "HomeworkHandle.h"
#import "HomeworkStatusModel.h"
#import "HomeworkManageViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HomeTableDataSource *dataSource;
@property (nonatomic, strong) HomeworkHeaderView *homeworkHeaderView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.tableView];
    [self loadData];
}

- (void)loadData {
    [HomeworkHandle homeworkWithPage:0 Success:^(id obj) {
        
        NSMutableArray *dataArr = @[].mutableCopy;
        for (HomeworkStatusModel *status in obj) {
            if (!status.isEnd) {
                [dataArr addObject:status];
            }
        }
        [self.dataSource reloadTable:dataArr];
    } failed:^(id obj) {
        
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        self.dataSource = [[HomeTableDataSource alloc] initWithTableView:_tableView];
        _tableView.dataSource = _dataSource;
        _tableView.delegate = _dataSource;
        _tableView.tableHeaderView = self.homeworkHeaderView;
        _tableView.allowsSelection = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

- (HomeworkHeaderView *)homeworkHeaderView {
    if (!_homeworkHeaderView) {
        _homeworkHeaderView = [HomeworkHeaderView homeworkHeaderView];
        __weak typeof(self) weakSelf = self;
        _homeworkHeaderView.publishHomeworkBlock = ^ {
            PublishHomeworkViewController *vc = [[PublishHomeworkViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        _homeworkHeaderView.personalCenterBlock = ^ {

            
        };
        _homeworkHeaderView.HomeworkManageBlock = ^ {
            HomeworkManageViewController *vc = [[HomeworkManageViewController alloc] init];
            vc.hidesBottomBarWhenPushed =  YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
    }
    return _homeworkHeaderView;
}


@end
