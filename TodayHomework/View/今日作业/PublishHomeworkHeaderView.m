//
//  PublishHomeworkHeaderView.m
//  TodayHomework
//
//  Created by wuqh on 15/12/8.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "PublishHomeworkHeaderView.h"
#import "THSubmitButton.h"

@implementation PublishHomeworkHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        THSubmitButton *submitBtn = [[THSubmitButton alloc] initWithFrame:CGRectMake(12, 4, SCREEN_WIDTH-24, 48)];
        [submitBtn setTitle:@"发 布" forState:UIControlStateNormal];
        [submitBtn addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:submitBtn];
        
    }
    return self;
}

- (void)submit:(THSubmitButton *)sender {
    if (self.publishHomework) {
        self.publishHomework(sender);
    }
}

@end
