//
//  Attachment.m
//  TodayHomework
//
//  Created by wuqh on 15/12/9.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "Attachment.h"
#import <UIButton+WebCache.h>
#import "THAPI.h"
#import "AttachmentInfoModel.h"
@implementation Attachment

- (void)setAttachmentInfo:(AttachmentInfoModel *)attachmentInfo {
    
    _attachmentInfo = attachmentInfo;
    NSURL *url = [NSURL URLWithString:[API_Picture stringByAppendingString:attachmentInfo.storagePath]];
    [self sd_setBackgroundImageWithURL:url forState:UIControlStateNormal];
    
}

@end
