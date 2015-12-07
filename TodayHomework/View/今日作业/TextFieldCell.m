//
//  TextFieldCell.m
//  TodayHomework
//
//  Created by wuqh on 15/12/1.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "TextFieldCell.h"

@interface TextFieldCell()

@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation TextFieldCell

+ (instancetype)textFiledCell {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

#pragma mark - init
- (void)awakeFromNib {
    // Initialization code
        [self initialize];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.dateTextField.inputView = self.datePicker;
}
    

- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
    }
    return _datePicker;
}

- (CGFloat)cellHeight {
    return 60;
}

@end
