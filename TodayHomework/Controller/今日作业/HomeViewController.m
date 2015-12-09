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
#import "HomeworkDetailViewController.h"
#import "CheckSituationViewController.h"
#import <MJRefresh.h>

@interface HomeViewController ()<HomeViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) HomeTableDataSource *dataSource;
@property (nonatomic, strong) HomeworkHeaderView *homeworkHeaderView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, assign) CGFloat page;
@end

@implementation HomeViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:NOTIFICATION_UPDATE_HOMEWORK object:nil];
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 0;
        [self loadData];
    }];
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.page++;
        [self loadData];
    }];
}

- (void)refresh {
    [self.tableView.header beginRefreshing];
}

- (void)loadData {
    
    if (self.page == 0) {
        [self.dataArr removeAllObjects];
    }
    [HomeworkHandle homeworkWithPage:self.page Success:^(id obj) {
        
        for (HomeworkStatusModel *status in obj) {
            if (!status.isEnd) {
                [self.dataArr addObject:status];
            }
        }
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];
        [self.dataSource reloadTable:self.dataArr];
    } failed:^(id obj) {
        
    }];
}

#pragma mark - HomeViewDelegate
- (void)homeWorkPushHomeDetailPage:(HomeworkStatusModel *)status {
    HomeworkDetailViewController *vc = [[HomeworkDetailViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.status = status;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)homeWorkPushCheckSituationPage:(HomeworkStatusModel *)status {
    CheckSituationViewController *vc = [[CheckSituationViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.status = status;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - getter
- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView = tableView;
        [self.view addSubview:tableView];
        
        self.dataSource = [[HomeTableDataSource alloc] initWithTableView:_tableView];
        self.dataSource.delegate = self;
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

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}


@end
