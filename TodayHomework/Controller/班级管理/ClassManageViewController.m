//
//  ClassManageViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "ClassManageViewController.h"
#import "AddClassViewController.h"

@interface ClassManageViewController ()

@end

@implementation ClassManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addClass:)];
}

- (void)addClass:(UIBarButtonItem *)item {
    
    AddClassViewController *addClassVc = [[AddClassViewController alloc] init];
    addClassVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:addClassVc animated:YES];
    
}

@end
