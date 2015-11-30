//
//  OtherClassCell.m
//  TodayHomework
//
//  Created by wuqh on 15/11/30.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "OtherClassCell.h"

@implementation OtherClassCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)otherClassCell {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (CGFloat)cellHeight {
    return 43;
}

@end
