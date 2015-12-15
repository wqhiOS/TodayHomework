//
//  ClassManageSubCell.m
//  TodayHomework
//
//  Created by wuqh on 15/12/11.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "ClassManageSubCell.h"
#import "ClassInfoModel.h"

@interface ClassManageSubCell()

@property (nonatomic, strong) ClassInfoModel *classInfo;
@property (nonatomic, assign) ClassManageType classManageType;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;


@end

@implementation ClassManageSubCell

- (void)awakeFromNib {
    // Initialization code
    self.totalLabel.textColor = THGreenColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setClassInfo:(ClassInfoModel *)classInfo type:(ClassManageType)type {
    
    self.classInfo = classInfo;
    self.classManageType = type;
    
}

- (void)setClassManageType:(ClassManageType)classManageType {
    _classManageType = classManageType;
    switch (_classManageType) {
        case ClassManageTypeStudent:
        {
            _typeLabel.text = @"班级学生";
            _totalLabel.text = [NSString stringWithFormat:@"%ld",self.classInfo.studentTotal];
        }
            break;
        case ClassManageTypeTeacher:
        {
            _typeLabel.text = @"班级教师";
            _totalLabel.text = [NSString stringWithFormat:@"%ld",self.classInfo.teacherTotal];
        }
            break;
        default:
            break;
    }
}


@end
