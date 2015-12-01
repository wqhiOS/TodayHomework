//
//  SelectSchoolHeaderView.h
//  TodayHomework
//
//  Created by wuqh on 15/11/29.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectSchoolButton.h"
@interface SelectSchoolHeaderView : UIView

@property (weak, nonatomic) IBOutlet SelectSchoolButton *provinceBtn;
@property (weak, nonatomic) IBOutlet SelectSchoolButton *cityBtn;
@property (weak, nonatomic) IBOutlet SelectSchoolButton *areaBtn;

+ (instancetype)selectSchoolHeaderView;

@end
