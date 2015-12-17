//
//  CheckAttachmentContainerView.m
//  TodayHomework
//
//  Created by wuqh on 15/12/9.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "CheckAttachmentContainerView.h"
#import "Attachment.h"
#import "AttachmentInfoModel.h"

@interface CheckAttachmentContainerView()


@end

@implementation CheckAttachmentContainerView

- (void)awakeFromNib {
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

//初始化
- (void)initialize {
    
}

- (void)setContainerViewWidth:(CGFloat)containerViewWidth {
    self.width =  containerViewWidth;
}

- (void)setAttachmentInfos:(NSArray *)attachmentInfos {
    _attachmentInfos = attachmentInfos;
    [self reloadAttachments];
}

- (void)reloadAttachments {
    
    CGFloat rowSpacing = 20;
    CGFloat columnSpacing = 20;
    NSInteger columnCount = 4;
    NSInteger rowCount = 1;
    
    NSInteger attachmentWidht = (self.width-(columnCount+1)*columnSpacing)/columnCount;

    if (self.attachmentInfos.count < columnCount) {
        rowCount = 1;
    }else {
        rowCount = self.attachmentInfos.count /columnCount;
        rowCount += self.attachmentInfos.count%columnCount==0?0:1;
    }
    for (int i = 0; i < self.attachmentInfos.count; i++) {
        Attachment *attachment = [[Attachment alloc] init];
        attachment.attachmentInfo = self.attachmentInfos[i];
        [attachment addTarget:self action:@selector(attachmentClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.attachments addObject:attachment];
        
        NSInteger row = i/columnCount;
        NSInteger col = i%columnCount;
        DLog(@"%ld-%ld",row,col);
        attachment.frame = CGRectMake(columnSpacing+col*(attachmentWidht+columnSpacing), row*(attachmentWidht+rowSpacing), attachmentWidht, attachmentWidht);
        [self addSubview:attachment];
    }
    
    if (self.updateHeight) {
        self.updateHeight(rowCount*(attachmentWidht+rowSpacing));
    }
  
}

- (NSMutableArray *)attachments {
    if (!_attachments) {
        _attachments = [NSMutableArray array];
    }
    return _attachments;
}

- (void)attachmentClick:(Attachment *)attachment {
    if ([self.delegate respondsToSelector:@selector(checkAttachment:)]) {
        [self.delegate checkAttachment:attachment];
    }
}


@end
