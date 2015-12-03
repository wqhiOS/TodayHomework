//
//  LoginViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "LoginViewController.h"
#import "TeacherRegisterViewController.h"
#import "THTextField.h"
#import "THTabBarController.h"
#import "UserInfoHandle.h"
#import "UserInfoTool.h"
@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet THTextField *userNameTf;
@property (weak, nonatomic) IBOutlet THTextField *passwordTf;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"今日作业";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"教师注册" style:UIBarButtonItemStylePlain target:self action:@selector(teacherRegister:)];
    [self.userNameTf setleftImage:@"bg_login_name"];
    [self.passwordTf setleftImage:@"bg_login_pwd"];
    
 
    
}

- (void)teacherRegister:(UIBarButtonItem *)item {
    [self.navigationController pushViewController:[TeacherRegisterViewController new] animated:YES];
}

- (IBAction)login:(id)sender {
    
    [UserInfoHandle loginWthLoginName:self.userNameTf.text andPassword:self.passwordTf.text success:^(id obj) {
        [UserInfoTool saveUserInfo:obj];
    } failed:^(id obj) {
        NSLog(@"%@",obj[@"message"]);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
