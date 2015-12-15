//
//  StudentManageCell.m
//  TodayHomework
//
//  Created by wuqh on 15/12/12.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "StudentManageCell.h"

@interface StudentManageCell()

@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UILabel *lb2;
@property (weak, nonatomic) IBOutlet UILabel *lb3;
@property (weak, nonatomic) IBOutlet UILabel *lb4;


@property (weak, nonatomic) IBOutlet UILabel *studentIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *studentNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *studentPwdLabel;
@property (weak, nonatomic) IBOutlet UIButton *studentMobileButton;


@end

@implementation StudentManageCell

- (void)awakeFromNib {
    // Initialization code
    self.layer.borderWidth = 0;
    
    self.lb1.backgroundColor = THTfBackgroundColor;
    self.lb2.backgroundColor = THTfBackgroundColor;
    self.lb3.backgroundColor = THTfBackgroundColor;
    self.lb4.backgroundColor = THTfBackgroundColor;
    
    self.studentIdLabel.backgroundColor = THTfBackgroundColor;
    self.studentNameLabel.backgroundColor = THTfBackgroundColor;
    self.studentPwdLabel.backgroundColor = THTfBackgroundColor;
    self.studentMobileButton.backgroundColor = THTfBackgroundColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setStudentInfo:(UserInfoModel *)studentInfo {
    self.studentIdLabel.text = studentInfo.loginName;
    self.studentPwdLabel.text = studentInfo.loginPassword;
    self.studentNameLabel.text = studentInfo.custName;
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:studentInfo.mobile attributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:1]}];
    [self.studentMobileButton setAttributedTitle:attributeStr forState:UIControlStateNormal];
   
}

@end
