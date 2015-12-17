//
//  ClassManageViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "ClassManageViewController.h"
#import "AddClassViewController.h"
#import "UserInfoHandle.h"
#import "ClassManageDataSource.h"
#import "ModifyClassInfoViewController.h"

@interface ClassManageViewController ()<ClassManageDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ClassManageDataSource *dataSource;

@end

@implementation ClassManageViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addClass:)];
    
    self.isCanTapCloseKeyBoard = NO;
    [self.view addSubview:self.tableView];
    [self loadClasses];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadClasses) name:NOTIFICATION_UPDATE_CLASSINFO object:nil];
    
}


#pragma mark - action
- (void)addClass:(UIBarButtonItem *)item {
    
    AddClassViewController *addClassVc = [[AddClassViewController alloc] init];
    addClassVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:addClassVc animated:YES];
    
}

#pragma mark - 获取教师的所有班级
- (void)loadClasses {
    [UserInfoHandle classesByTeacerSuccess:^(id obj) {
       
        self.dataSource.classes = obj;
        [self.tableView reloadData];
        
    } failed:^(id obj) {
        
    }];
}

#pragma mark - getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        self.dataSource = [[ClassManageDataSource alloc] initWithTableView:_tableView];
        self.dataSource.delegate = self;
        _tableView.delegate = self.dataSource;
        _tableView.dataSource = self.dataSource;
        
    }
    return _tableView;
}

#pragma mark - ClassManageDelegate
- (void)classManagePushSubViewController:(BaseViewController *)vc {
    [self.navigationController pushViewController:vc animated:YES];
}



@end
