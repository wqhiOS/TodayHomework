//
//  ClassManageSubCell.h
//  TodayHomework
//
//  Created by wuqh on 15/12/11.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ClassManageType) {
    ClassManageTypeStudent = 1,
    ClassManageTypeTeacher
};

@class ClassInfoModel;
@interface ClassManageSubCell : UITableViewCell

- (void)setClassInfo:(ClassInfoModel *)classInfo type:(ClassManageType)type;

@end
