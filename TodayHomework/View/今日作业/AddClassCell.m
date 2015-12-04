//
//  AddClassCell.m
//  TodayHomework
//
//  Created by wuqh on 15/11/30.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "AddClassCell.h"




@interface AddClassCell()




@end

@implementation AddClassCell

+ (instancetype)addClassCell {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    // Initialization code

}

- (CGFloat)containerWidth {
    return (SCREEN_WIDTH - self.containerView.x);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setAddClassState:(AddClassState)addClassState {
    _addClassState = addClassState;
    switch (addClassState) {
        case AddClassStateEducationalStage:
        {
            self.titleLabel.text = @"教育阶段";
            
            [self.containerView setUpWithTitles:@[@"小学",@"初中",@"高中"] type:WUButtonTypeRadio width:self.containerWidth finished:^(CGFloat height) {
                self.containerHeight.constant = height;
            }];
            
        }
            break;
        case AddClassStateEducationalSystem:
        {
            self.titleLabel.text = @"选择学制";
            [self.containerView setUpWithTitles:@[@"五年制",@"六年制"] type:WUButtonTypeRadio width:self.containerWidth finished:^(CGFloat height) {
                self.containerHeight.constant = height;
            }];
            
        }
            break;
        case AddClassStateGrade:
        {
            self.titleLabel.text = @"选择年级";
            [self.containerView setUpWithTitles:@[@"一年级",@"二年级",@"三年级",@"四年级",@"五年级"] type:WUButtonTypeRadio width:self.containerWidth finished:^(CGFloat height) {
                self.containerHeight.constant = height;
            }];
            
        }
            break;
        case AddClassStateClass:
        {
            self.titleLabel.text = @"选择班级";
            [self.containerView setUpWithTitles:@[@"1班",@"2班",@"3班",@"4班",@"5班",@"6班",@"7班",@"8班",@"9班"] type:WUButtonTypeMultiple width:self.containerWidth finished:^(CGFloat height) {
                self.containerHeight.constant = height;
            }];

        }
            break;
        case AddClassStateMyClass:
        {
            self.titleLabel.text = @"我的班级";
            [self.containerView setUpWithTitles:@[@"小学一年级1班",@"小学一年级2班",@"小学一年级3班",@"小学一年级4班",@"小学一年级5班",@"小学一年级6班"] type:WUButtonTypeMultiple width:self.containerWidth finished:^(CGFloat height) {
                self.containerHeight.constant = height;
            }];
            for (WUButton *button in self.containerView.buttons) {
                [button setImage:nil forState:UIControlStateNormal];
            }
            
        }
            break;
        default:
            break;
    }

}


- (CGFloat)cellHeight {
    return self.containerHeight.constant+8;
}
@end
