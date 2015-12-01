//
//  SelectSchoolHeaderView.m
//  TodayHomework
//
//  Created by wuqh on 15/11/29.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "SelectSchoolHeaderView.h"

@implementation SelectSchoolHeaderView

+ (instancetype)selectSchoolHeaderView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    self.provinceBtn.hideDeleteImage = YES;
    self.provinceBtn.enabled = NO;
    self.cityBtn.hidden = YES;
    self.areaBtn.hidden = YES;
    
}


@end
