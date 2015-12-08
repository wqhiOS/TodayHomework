//
//  AddAttachmentCell.h
//  TodayHomework
//
//  Created by wuqh on 15/12/8.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttachmentContainerView.h"
@interface AddAttachmentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet AttachmentContainerView *attachmentContainerView;
+(instancetype)addAttachmentCell;
- (CGFloat)cellHeight;
@end
