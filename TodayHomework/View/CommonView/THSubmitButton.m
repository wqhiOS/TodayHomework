//
//  THSubmitButton.m
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "THSubmitButton.h"

@implementation THSubmitButton


- (void)awakeFromNib {
    [self initialize];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.backgroundColor = THGreenColor;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

@end
