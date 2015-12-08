//
//  AttachmentPhoto.h
//  添加附件demo
//
//  Created by wuqh on 15/11/12.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AttachmentPhoto;
typedef void (^AttachmentPhotoDeleteBlockType)(AttachmentPhoto *attachment);

@interface AttachmentPhoto : UIImageView

@property (nonatomic, copy) AttachmentPhotoDeleteBlockType attachmentPhotodDeleteBlock;

@end
