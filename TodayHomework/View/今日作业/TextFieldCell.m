//
//  TextFieldCell.m
//  TodayHomework
//
//  Created by wuqh on 15/12/1.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "TextFieldCell.h"
#import "CustomInputAccessoryView.h"
#import "AppUtils.h"

@interface TextFieldCell()<CustomInputAccessoryViewDelegate>

@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) CustomInputAccessoryView *inputAccessoryView;

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
    self.dateTextField.inputAccessoryView = self.inputAccessoryView;
    
    self.dateTextField.text = [AppUtils stringFromDate:[NSDate date]];
}


- (CustomInputAccessoryView *)inputAccessoryView {
    if (!_inputAccessoryView) {
        _inputAccessoryView = [[CustomInputAccessoryView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        _inputAccessoryView.customDelegate = self;
    }
    return _inputAccessoryView;
}

- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.datePickerMode = UIDatePickerModeDate;
        _datePicker.backgroundColor = [UIColor whiteColor];
    }
    return _datePicker;
}

- (CGFloat)cellHeight {
    return 60;
}

#pragma mark - CustomInputAccessoryViewDelegate
- (void)customInputAccessoryViewCancel {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (void)customInputAccessoryViewConfirm {
    self.dateTextField.text = [AppUtils stringFromDate:self.datePicker.date];
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

@end
