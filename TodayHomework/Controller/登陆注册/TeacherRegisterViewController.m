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

@interface TeacherRegisterViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraints;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewHeihtConstraint;

@property (weak, nonatomic) IBOutlet THTextField *emailTf;
@property (weak, nonatomic) IBOutlet THTextField *verificationCodeTf;
@property (weak, nonatomic) IBOutlet THTextField *realNameTf;
@property (weak, nonatomic) IBOutlet THTextField *passwordTf;
@property (weak, nonatomic) IBOutlet THTextField *confirmPasswordTf;
@property (weak, nonatomic) IBOutlet THTextField *schoolTf;

@property (weak, nonatomic) IBOutlet WUButtonContainrView *subjectContainerView;

@end

@implementation TeacherRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"教师注册";
    self.widthConstraints.constant = SCREEN_WIDTH - 8*2;
    NSLog(@"%f",self.subjectContainerView.width);
    
    [self setupTextField];
    CGFloat containerViewWidth = SCREEN_WIDTH - self.subjectContainerView.x - 8;
    [self.subjectContainerView setUpWithTitles:[NSMutableArray arrayWithObjects:@"语文",@"数学",@"化学",@"生物",@"英语",@"历史",@"地理",@"政治",@"物理",@"其他",nil] type:WUButtonTypeMultiple width:containerViewWidth finished:^(CGFloat height) {
        [UIView animateWithDuration:0.4 animations:^{
            self.containerViewHeihtConstraint.constant = height;
        }];
    }];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)viewDidAppear:(BOOL)animated {
    
}

- (void)setupTextField {
    [self.emailTf setleftImage:@"bg_login_email"];
    [self.verificationCodeTf setleftImage:@"bg_login_valid"];
    [self.realNameTf setleftImage:@"bg_login_truename"];
    [self.passwordTf setleftImage:@"bg_login_pwd"];
    [self.confirmPasswordTf setleftImage:@"bg_login_pwd"];
    [self.schoolTf setleftImage:@"bg_login_pwd"];
}

@end
