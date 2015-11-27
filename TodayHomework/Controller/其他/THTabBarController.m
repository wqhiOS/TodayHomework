//
//  THTabBarController.m
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "THTabBarController.h"

#import "BaseViewController.h"
#import "THNavigationController.h"

#import "HomeViewController.h"
#import "ClassManageViewController.h"
#import "PersonalCenterViewController.h"

@interface THTabBarController ()

@end

@implementation THTabBarController

+ (void)initialize {
  
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:THGreenColor} forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildVC:[HomeViewController new] iconNamed:@"tabBar_jrzy" title:@"今日作业"];
    [self addChildVC:[ClassManageViewController new] iconNamed:@"tabBar_bjgl" title:@"班级管理"];
    [self addChildVC:[PersonalCenterViewController new] iconNamed:@"tabBar_grzx" title:@"个人中心"];
    
    
}


- (void)addChildVC:(BaseViewController *)vc iconNamed:(NSString *)iconName title:(NSString *)title {
    
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",iconName]];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_focus",iconName]];
    THNavigationController *nav = [[THNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end
