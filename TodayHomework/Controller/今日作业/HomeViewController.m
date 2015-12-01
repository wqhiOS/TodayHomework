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

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HomeworkHeaderView *homeworkHeaderView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableHeaderView = self.homeworkHeaderView;
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
            
        };
    }
    return _homeworkHeaderView;
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}



@end
