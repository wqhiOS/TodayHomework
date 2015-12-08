//
//  HomeworkContentCell.h
//  TodayHomework
//
//  Created by wuqh on 15/12/8.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeworkContentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;
+ (instancetype)homeworkContentCell;
- (CGFloat)cellHeight;


@end
