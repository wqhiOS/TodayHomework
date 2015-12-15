//
//  ClassManageSutdentViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/12/12.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "ClassManageStudentViewController.h"
#import "UserInfoHandle.h"
#import "ClassInfoModel.h"
#import "StudentManageCell.h"
#import "MJRefresh.h"

@interface ClassManageStudentViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSString *_classId;
    NSArray *_students;
}
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation ClassManageStudentViewController

- (instancetype)initWithClassId:(NSString *)classId {
    if (self = [super init]) {
        _classId = classId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"学生管理";
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadStudentsInfo];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_more"] style:UIBarButtonItemStylePlain target:self action:@selector(more:)];
}

- (void)more:(UIBarButtonItem *)item {
    
}

- (void)loadStudentsInfo {
    [UserInfoHandle classStudentsInfo:_classId success:^(id obj) {
        _students = obj;
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failed:^(id obj) {
        
    }];
}
#pragma mark - getter
 NSString *cellID = @"cellId";
- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView = tableView;
        [self.view addSubview:tableView];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 72;
        _tableView.sectionFooterHeight = CGFLOAT_MIN;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([StudentManageCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _students.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StudentManageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.studentInfo = _students[indexPath.section];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}


@end
