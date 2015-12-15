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
#import "HomeworkDeleteButton.h"
#import <MJRefresh.h>

@interface HomeworkManageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) HomeworkDeleteButton *deleteBtn;
@property (nonatomic, strong) NSMutableArray *selectedDeleteHomeworks;
@property (nonatomic, assign) NSInteger page;

@end

@implementation HomeworkManageViewController

static NSString *cellId = @"HomeCellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"作业管理";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(trash)];
    self.isCanTapCloseKeyBoard = NO;
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 0;
        [self loadDataWithPage:self.page];
    }];
    [self.tableView.mj_header beginRefreshing];
    //上拉加载
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.page++;
        [self loadDataWithPage:self.page];
    }];
    
    [self.view addSubview:self.deleteBtn];
    
}

#pragma mark - loadData
- (void)loadDataWithPage:(NSInteger)page {
  
    
    [HomeworkHandle homeworkWithPage:page Success:^(id obj) {
        
        if (page == 0) {
            self.dataArr = obj;
        }else {
            [self.dataArr addObjectsFromArray:obj];
        }
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } failed:^(id obj) {
        
    }];
}


#pragma mark - 删除作业
- (void)deleteHomework {

    NSMutableArray *homeworkIdArr = @[].mutableCopy;
    for (HomeworkStatusModel *status in self.selectedDeleteHomeworks) {
        [homeworkIdArr addObject:status.busyworkInfo.id];
    }
    NSString *homeworkIds = [homeworkIdArr componentsJoinedByString:@","];
    
    [HomeworkHandle deleteHomework:homeworkIds success:^(id obj) {
        [self deleteHomeworkSuccess:obj];
    } failed:^(id obj) {
        
    }];
}
- (void)deleteHomeworkSuccess:(NSString *)obj {

    [self.dataArr removeObjectsInArray:self.selectedDeleteHomeworks];
    [self.tableView reloadData];
    [self trash];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_UPDATE_HOMEWORK object:nil];
    
}

#pragma mark - action
- (void)trash {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    self.tableView.allowsMultipleSelection = self.tableView.editing;
    [self showOrHideDeleteButton:self.tableView.editing];
    if (self.tableView.editing == YES) {
        [self.selectedDeleteHomeworks removeAllObjects];
    }
}

- (void)showOrHideDeleteButton:(BOOL)isShow {
    [UIView animateWithDuration:0.4 animations:^{
       
        self.deleteBtn.y =SCREEN_HEIGHT-isShow*48;
        self.tableView.height = SCREEN_HEIGHT-isShow*48;
        
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

#pragma mark - UITableViewDelegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeworkStatusModel *status = self.dataArr[indexPath.row];
    [self.selectedDeleteHomeworks addObject:status];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeworkStatusModel *status = self.dataArr[indexPath.row];
    [self.selectedDeleteHomeworks removeObject:status];
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
}

#pragma mark -getter
- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView = tableView;
        [self.view addSubview:_tableView];
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

- (HomeworkDeleteButton *)deleteBtn {
    if (!_deleteBtn) {
        _deleteBtn = [[HomeworkDeleteButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 48)];
        __weak typeof(self) weakSelf = self;
        _deleteBtn.deleteHomework = ^(HomeworkDeleteButton* button) {
            [weakSelf deleteHomework];
        };
    }
    return _deleteBtn;
}

- (NSMutableArray *)selectedDeleteHomeworks {
    if (!_selectedDeleteHomeworks) {
        _selectedDeleteHomeworks = [NSMutableArray array];
    }
    return _selectedDeleteHomeworks;
}

@end
