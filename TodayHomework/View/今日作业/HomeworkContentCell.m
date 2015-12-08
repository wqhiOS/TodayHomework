//
//  HomeworkContentCell.m
//  TodayHomework
//
//  Created by wuqh on 15/12/8.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "HomeworkContentCell.h"

@interface HomeworkContentCell()




@end

@implementation HomeworkContentCell

+ (instancetype)homeworkContentCell {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HomeworkContentCell class]) owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    // Initialization code
    self.textView.backgroundColor = THTfBackgroundColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (CGFloat)cellHeight {
    return 95.f;
}


@end
