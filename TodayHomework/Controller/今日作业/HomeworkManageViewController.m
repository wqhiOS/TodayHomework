//
//  HomeworkManageViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/12/7.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "HomeworkManageViewController.h"
#import "HomeCell.h"
#import "HomeworkHandle.h"
#import "CheckSituationViewController.h"
#import "ModifyHomeworkViewController.h"
#import "HomeworkDetailViewController.h"
#import "UploadAnswerViewController.h"
#import "ModifyAnswerViewController.h"

@interface HomeworkManageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation HomeworkManageViewController

static NSString *cellId = @"HomeCellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"作业管理";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(trash:)];
    [self.view addSubview:self.tableView];
    [self loadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:cellId];
        _tableView.rowHeight = 110.f;
         _tableView.allowsSelection = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

#pragma mark - action
- (void)trash:(UIBarButtonItem *)item {
    
}

#pragma mark - loadData 
- (void)loadData {
    [HomeworkHandle homeworkWithPage:0 Success:^(id obj) {
        self.dataArr = obj;
        [self.tableView reloadData];
    } failed:^(id obj) {
        
    }];
}

#pragma mark - UITableViewDataSource 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    HomeworkStatusModel *status = self.dataArr[indexPath.row];
    cell.status = status;
    cell.isHomeworkManagePage = YES;
    cell.homeworkDetailBlock = ^ {
        if (status.isEnd) {//如果作业未结束， 修改作业
            CheckSituationViewController *vc = [[CheckSituationViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else {//如果作业已经结束 查看情况
            ModifyHomeworkViewController *vc = [[ModifyHomeworkViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    };
    cell.checkHomeworkSituation = ^ {
        if (status.isEnd) {
            HomeworkDetailViewController *vc = [[HomeworkDetailViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else {
            if (status.listAttachmentInfoANSWER.count) {
                ModifyAnswerViewController *vc = [[ModifyAnswerViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }else {
                UploadAnswerViewController *vc = [[UploadAnswerViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
    };
    return cell;
}

@end
