//
//  HomeworkDeleteButton.m
//  TodayHomework
//
//  Created by wuqh on 15/12/9.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "HomeworkDeleteButton.h"

@implementation HomeworkDeleteButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = UIColorFromRGB(0xeb6c6c);
        [self setTitle:@"删除" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(deleteHomework:) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}

- (void)deleteHomework:(HomeworkDeleteButton*)sender {
    if (self.deleteHomework) {
        self.deleteHomework(sender);
    }
}

@end
