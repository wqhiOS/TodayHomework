//
//  TeacherRegisterViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "TeacherRegisterViewController.h"
#import "THTextField.h"
#import "WUButtonContainrView.h"
#import "SelectSchoolViewController.h"

@interface TeacherRegisterViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraints;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewHeihtConstraint;

@property (weak, nonatomic) IBOutlet THTextField *emailTf;
@property (weak, nonatomic) IBOutlet THTextField *verificationCodeTf;
@property (weak, nonatomic) IBOutlet THTextField *realNameTf;
@property (weak, nonatomic) IBOutlet THTextField *passwordTf;
@property (weak, nonatomic) IBOutlet THTextField *confirmPasswordTf;
@property (weak, nonatomic) IBOutlet THTextField *schoolTf;
@property (nonatomic ,strong) UIButton *checkCodeBtn;
@property (nonatomic, strong) UIButton *selectSchoolBtn;

@property (weak, nonatomic) IBOutlet WUButtonContainrView *subjectContainerView;

@end

@implementation TeacherRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"教师注册";
    self.widthConstraints.constant = SCREEN_WIDTH - 8*2;
    
    [self setupTextField];
    CGFloat containerViewWidth = SCREEN_WIDTH - self.subjectContainerView.x - 8;
    
    NSMutableArray *data = @[@{@"name":@"语文",@"subjectId":@"0"},@{@"name":@"数学",@"subjectId":@"1"},@{@"name":@"英语",@"subjectId":@"2"},@{@"name":@"生物",@"subjectId":@"3"}].mutableCopy;

    
    [self.subjectContainerView setUpWithTitles:[NSMutableArray arrayWithObjects:@"语文",@"数学",@"化学",@"生物",@"英语",@"历史",@"地理",@"政治",@"物理",@"其他",nil] type:WUButtonTypeMultiple width:containerViewWidth finished:^(CGFloat height) {
        [UIView animateWithDuration:0.4 animations:^{
            self.containerViewHeihtConstraint.constant = height;
        }];
    }];
   
}

- (void)setupTextField {
    [self.emailTf setleftImage:@"bg_login_email"];
    [self.verificationCodeTf setleftImage:@"bg_login_valid"];
    self.verificationCodeTf.rightViewMode = UITextFieldViewModeAlways;
    self.verificationCodeTf.rightView = self.checkCodeBtn;
    [self.realNameTf setleftImage:@"bg_login_truename"];
    [self.passwordTf setleftImage:@"bg_login_pwd"];
    [self.confirmPasswordTf setleftImage:@"bg_login_pwd"];
    [self.schoolTf setleftImage:@"bg_login_pwd"];
    self.schoolTf.rightViewMode = UITextFieldViewModeAlways;
    self.schoolTf.rightView = self.selectSchoolBtn;
    self.schoolTf.delegate = self;
}

#pragma mark - getter
- (UIButton *)checkCodeBtn {
    if (!_checkCodeBtn) {
        _checkCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom ];
        [_checkCodeBtn setBackgroundImage:[UIImage imageNamed:@"vcode"] forState:UIControlStateNormal];
        _checkCodeBtn.frame = CGRectMake(0, 0, 100, 48);
        [self updateCheckCode:_checkCodeBtn];
        [_checkCodeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_checkCodeBtn addTarget:self action:@selector(updateCheckCode:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _checkCodeBtn;
}

- (UIButton *)selectSchoolBtn {
    if (!_selectSchoolBtn) {
        _selectSchoolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectSchoolBtn.backgroundColor = THGreenColor;
        [_selectSchoolBtn setTitle:@"选择学校" forState:UIControlStateNormal];
        _selectSchoolBtn.frame = CGRectMake(0, 0, 100, 48);
        [_selectSchoolBtn addTarget:self action:@selector(selectSchool:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectSchoolBtn;
}

#pragma mark - action
- (void)updateCheckCode:(UIButton *)btn {
    
    NSString *checkCode = [NSString stringWithFormat:@"%d",arc4random_uniform(9000)+1000];
    [btn setTitle:checkCode forState:UIControlStateNormal];
}

- (void)selectSchool:(UIButton *)btn {
    SelectSchoolViewController *selectedSchoolVC = [[SelectSchoolViewController alloc] init];
    
    selectedSchoolVC.selecteSchool = ^(NSString *selectedSchool) {
        self.schoolTf.text = selectedSchool;
    };
    [self.navigationController pushViewController:selectedSchoolVC animated:YES];

}

- (void)selectSchoolViewController:(SelectSchoolViewController *)selectSchoolVC selectedSchool:(NSString *)selectedSchool {
    self.schoolTf.text = selectedSchool;
}

- (IBAction)registerClick:(id)sender {
    
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"%s",__func__);
    [self selectSchool:self.selectSchoolBtn ];
    return NO;
}
@end
