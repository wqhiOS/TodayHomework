//
//  PersonalCenterViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "PersonalCenterItemCell.h"
#import "PersonalCenterSubItemCell.h"
#import "HeaderIconCell.h"
#import "UserInfoTool.h"
#import "AppDelegate.h"

@interface PersonalCenterViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) NSArray *cellArr;
@end

@implementation PersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initData];
    [self initCell];
    [self.view addSubview:self.tableView];
    self.isCanTapCloseKeyBoard = NO;
 
}

- (void)initCell {
    
    HeaderIconCell *headerIconcell = [HeaderIconCell headerIconCell];
    NSArray *cellArr_0 = @[headerIconcell];
    
    PersonalCenterItemCell *personalCenterCell = [PersonalCenterItemCell personalCenterItemCell];
    NSArray *cellArr_1 = @[personalCenterCell];
    
    PersonalCenterItemCell *messageCell = [PersonalCenterItemCell personalCenterItemCell];
    NSArray *cellArr_2 = @[messageCell];
    
    PersonalCenterItemCell *safeCell = [PersonalCenterItemCell personalCenterItemCell];
    PersonalCenterSubItemCell *emailCell = [PersonalCenterSubItemCell personalCenterSubItemCell];
    PersonalCenterSubItemCell *loginPwdCell = [PersonalCenterSubItemCell personalCenterSubItemCell];
    PersonalCenterSubItemCell *tradePwdCell = [PersonalCenterSubItemCell personalCenterSubItemCell];
    NSArray *cellArr_3 = @[safeCell,emailCell,loginPwdCell,tradePwdCell];
    
    PersonalCenterItemCell *contactCell = [PersonalCenterItemCell personalCenterItemCell];
    NSArray *cellArr_4 = @[contactCell];
    
    PersonalCenterItemCell *exitCell = [PersonalCenterItemCell personalCenterItemCell];
    exitCell.personalCenterCellBlock = ^ {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"确认要退出吗？" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
        [alertView show];
    };
    NSArray *cellArr_5 = @[exitCell];
    
    self.cellArr = @[cellArr_0,cellArr_1,cellArr_2,cellArr_3,cellArr_4,cellArr_5];
    
}

- (void)initData {
    
    UserInfoModel *userInfo = [UserInfoTool userInfo];
    
    NSMutableArray *group_0 = @[].mutableCopy;
    NSDictionary *dict0 = @{@"name":userInfo.custName,@"iconHeader":userInfo.icon};
    [group_0 addObject:dict0];
    
    NSMutableArray *group_1 = @[].mutableCopy;
    NSDictionary *dict1= @{@"icon":@"personal_center",@"title":@"个人中心"};
    [group_1 addObject:dict1];
    
    NSMutableArray *group_2 = @[].mutableCopy;
    NSDictionary *dict2 = @{@"icon":@"message",@"title":@"消息中心"};
    [group_2 addObject:dict2];
    
    NSMutableArray *group_3 = @[].mutableCopy;
    NSDictionary *dict3 = @{@"icon":@"account_safe",@"title":@"安全中心"};
    NSDictionary *dict4 = @{@"title":@"邮箱绑定",@"subTitle":userInfo.email};
    NSDictionary *dict5 = @{@"title":@"修改登陆密码"};
    NSDictionary *dict6 = @{@"title":@"修改手势密码"};
    [group_3 addObjectsFromArray:@[dict3,dict4,dict5,dict6]];
    
    NSMutableArray *group_4 = @[].mutableCopy;
    NSDictionary *dict7 = @{@"icon":@"icon_lx_05",@"title":@"联系我们"};
    [group_4 addObject:dict7];
    
    NSMutableArray *group_5 = @[].mutableCopy;
    NSDictionary *dict8 = @{@"icon":@"login_out",@"title":@"退出登陆"};
    [group_5 addObject:dict8];
    
    self.dataArr = @[group_0,group_1,group_2,group_3,group_4,group_5];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
//        _tableView.backgroundColor = UIColorFromRGB(0xf3f3f3);
       
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArr[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    [self.cellArr[indexPath.section][indexPath.row] updateUIWithDictionary:self.dataArr[indexPath.section][indexPath.row] withIndexPath:indexPath];
    [self.cellArr[indexPath.section][indexPath.row] setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return self.cellArr[indexPath.section][indexPath.row];
    
}
#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if ([self.cellArr[indexPath.section][indexPath.row] personalCenterCellBlock]) {
        [self.cellArr[indexPath.section][indexPath.row] personalCenterCellBlock]() ;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    }else {
        return 44;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 12.f;
}

//
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex ==1) {
        [UserInfoTool saveUserInfo:nil];
        [(AppDelegate * )[UIApplication sharedApplication].delegate startLogin];
    }
}
@end
