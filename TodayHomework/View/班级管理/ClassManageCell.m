//
//  ClassManageCell.m
//  TodayHomework
//
//  Created by wuqh on 15/12/11.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "ClassManageCell.h"
#import "ClassInfoModel.h"

@interface ClassManageCell()

@property (weak, nonatomic) IBOutlet UILabel *classNameLabel;

@end

@implementation ClassManageCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setClassInfo:(ClassInfoModel *)classInfo {
    self.classNameLabel.text = [NSString stringWithFormat:@"%@%@%@%@",classInfo.educationStage,classInfo.educationYear,classInfo.gradeId,classInfo.classedId];
}

@end
