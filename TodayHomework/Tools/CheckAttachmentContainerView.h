//
//  CheckAttachmentContainerView.h
//  TodayHomework
//
//  Created by wuqh on 15/12/9.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckAttachmentContainerView : UIView
@property (nonatomic, strong) NSArray *attachmentInfos;
@property (nonatomic, assign) CGFloat containerViewWidth;
@property (nonatomic, copy) void (^updateHeight)(CGFloat);
@end