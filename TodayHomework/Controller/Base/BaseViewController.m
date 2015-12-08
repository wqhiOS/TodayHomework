//
//  BaseViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UITapGestureRecognizer *tap;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromRGB(0xf3f3f3);
    self.isCanTapCloseKeyBoard = YES;
}

- (void)setIsCanTapCloseKeyBoard:(BOOL)isCanTapCloseKeyBoard {
    if (isCanTapCloseKeyBoard) {
        [self.view addGestureRecognizer:self.tap];
    }else {
        if (_tap) {
            [self.view removeGestureRecognizer:_tap];
        }
    }
}

- (UITapGestureRecognizer *)tap {
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        _tap.numberOfTapsRequired = 1;
        _tap.numberOfTouchesRequired = 1;
    }
    return _tap;
}

- (void)tap:(UITapGestureRecognizer *)tap {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

@end
