//
//  HomeworkHeaderView.m
//  TodayHomework
//
//  Created by wuqh on 15/12/1.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "HomeworkHeaderView.h"

@interface HomeworkHeaderView()



@end

@implementation HomeworkHeaderView

+ (instancetype)homeworkHeaderView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (IBAction)personalCenterClick:(id)sender {
    
    if (self.personalCenterBlock) {
        self.personalCenterBlock();
    }
    
}

- (IBAction)publshHomeworkClick:(id)sender {
    
    if (self.publishHomeworkBlock) {
        self.publishHomeworkBlock();
    }
    
}

- (IBAction)homeworkManageClick:(id)sender {
    if (self.HomeworkManageBlock) {
        self.HomeworkManageBlock();
    }
}
@end
