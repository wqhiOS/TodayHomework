//
//  AttachmentContainerView.h
//  education
//
//  Created by wuqh on 15/11/12.
//  Copyright © 2015年 善林金融. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Frame.h"
@class AttachmentContainerView;
typedef void (^AddAttachmentBlockType)(AttachmentContainerView *);

@interface AttachmentContainerView : UIView

/**
 *  已添加的附件数组
 */
@property (nonatomic, strong) NSMutableArray *attachmentsArray;

/**
 *  添加附件按钮
 */
@property (nonatomic, copy) AddAttachmentBlockType addAttachmentBlock;

@property (nonatomic, copy) AddAttachmentBlockType deleteAttachmentBlock;
/**
 *  设置附件行间距 默认20
 */
@property (nonatomic, assign) CGFloat attachmentRowSpacing;
/**
 *  设置附件列间距 默认20
 */
@property (nonatomic, assign) CGFloat attachmentColumnSpacing;
/**
 *  设置每行附件个数 默认为4
 */
@property (nonatomic, assign) NSInteger rowAttachmentCount;

/**
 *  设置附件图片
 *
 *  @param image 图片
 */
- (void)addAttachmentWithImage:(UIImage *)image;

/**
 *  刷新附件容器，重新排列附件
 */
- (void)reloadAttachments;

@end
