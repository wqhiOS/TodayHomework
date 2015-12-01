//
//  TextFieldCell.m
//  TodayHomework
//
//  Created by wuqh on 15/12/1.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "TextFieldCell.h"

@implementation TextFieldCell

+ (instancetype)textFiledCell {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (CGFloat)cellHeight {
    return 44;
}

@end
