//
//  AddClassCell.h
//  TodayHomework
//
//  Created by wuqh on 15/11/30.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WUButtonContainrView.h"

typedef NS_ENUM(NSUInteger, AddClassState) {
    AddClassStateEducationalStage,
    AddClassStateEducationalSystem,
    AddClassStateGrade,
    AddClassStateClass,
    AddClassStateMyClass
};

@interface AddClassCell : UITableViewCell

@property (weak, nonatomic) IBOutlet WUButtonContainrView *containerView;
@property (nonatomic, assign) AddClassState addClassState;
@property (nonatomic, assign) CGFloat containerWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerHeight;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

+ (instancetype)addClassCell;
- (CGFloat)cellHeight;

@end
