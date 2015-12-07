//
//  TextFieldCell.h
//  TodayHomework
//
//  Created by wuqh on 15/12/1.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THTextField.h"

@interface TextFieldCell : UITableViewCell

@property (weak, nonatomic) IBOutlet THTextField *dateTextField;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


+ (instancetype)textFiledCell;

- (CGFloat)cellHeight;

@end
