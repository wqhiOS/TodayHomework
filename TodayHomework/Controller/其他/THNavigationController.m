//
//  THNavigationController.m
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "THNavigationController.h"

@interface THNavigationController ()

@end

@implementation THNavigationController

+ (void)initialize {
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:[THNavigationController class], nil];
    [navBar setBarTintColor:THGreenColor];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [navBar setTintColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
}

@end
