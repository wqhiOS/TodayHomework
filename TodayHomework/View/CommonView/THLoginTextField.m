//
//  THLoginTextField.m
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "THLoginTextField.h"

@implementation THLoginTextField

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
    self.leftViewMode = UITextFieldViewModeAlways;
    
}

@end
