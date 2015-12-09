//
//  AttachmentPhoto.m
//  添加附件demo
//
//  Created by wuqh on 15/11/12.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "AttachmentPhoto.h"
#import "UIView+Frame.h"

@interface AttachmentPhoto()

@property (nonatomic, strong) UIButton *deleteButton;

@end

@implementation AttachmentPhoto

- (UIButton *)deleteButton {
    
    if (!_deleteButton) {
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteButton setImage:[UIImage imageNamed:@"icon_delete"] forState:UIControlStateNormal];
        [_deleteButton sizeToFit];
        [_deleteButton addTarget:self action:@selector(deleteAttachment:) forControlEvents:UIControlEventTouchUpInside];
        _deleteButton.x = self.width - _deleteButton.width;
        _deleteButton.y = 0;
    }
    return _deleteButton;
}

- (void)awakeFromNib {
    [self addSubview:self.deleteButton];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.deleteButton];
        self.userInteractionEnabled = YES;
        
    }
    return self;
}

- (void)deleteAttachment:(UIButton *)button {
    if (self.attachmentPhotodDeleteBlock) {
        self.attachmentPhotodDeleteBlock(self);
    }
}


@end
