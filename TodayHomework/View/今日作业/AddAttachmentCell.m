//
//  AddAttachmentCell.m
//  TodayHomework
//
//  Created by wuqh on 15/12/8.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "AddAttachmentCell.h"

@interface AddAttachmentCell()



@end

@implementation AddAttachmentCell

+ (instancetype)addAttachmentCell {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([AddAttachmentCell class]) owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (CGFloat)cellHeight {
    return self.attachmentContainerView.height + 33;
}

@end
