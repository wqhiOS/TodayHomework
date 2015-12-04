//
//  PersonalCenterItemCell.h
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalCenterItemCell : UITableViewCell

@property (nonatomic, copy) void(^personalCenterCellBlock)(void);

+ (instancetype)personalCenterItemCell;

- (void)updateUIWithDictionary:(NSDictionary *)dict withIndexPath:(NSIndexPath *)indexPath;

@end
