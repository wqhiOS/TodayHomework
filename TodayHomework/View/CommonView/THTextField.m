//
//  THTextField.m
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "THTextField.h"

@implementation THTextField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib {
    [self initialize];
}

- (void)initialize {
    self.backgroundColor = THTfBackgroundColor;
    self.borderStyle = UITextBorderStyleNone;
}

- (void)setleftImage:(NSString *)imageName {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    imageView.frame = CGRectMake(0, 0, 45, 40);
    self.leftView = imageView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end
