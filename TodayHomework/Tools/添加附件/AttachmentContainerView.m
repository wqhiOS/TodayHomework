//
//  AttachmentContainerView.m
//  education
//
//  Created by wuqh on 15/11/12.
//  Copyright © 2015年 善林金融. All rights reserved.
//

#import "AttachmentContainerView.h"

#define ScreenFullWidth [UIScreen mainScreen].bounds.size.width
#define ScreenFullHeight  [UIScreen mainScreen].bounds.size.height

@interface AttachmentContainerView()<UIActionSheetDelegate>

@property (nonatomic, strong) UIButton *addAttachmentButton;

@property (nonatomic, assign) CGFloat attachmentWidth;
@property (nonatomic, assign) CGFloat attachmentHeight;




@property (nonatomic, assign) NSInteger rowCount;

@end

@implementation AttachmentContainerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {
    [self setUp];
}

#pragma mark - setup
- (void)setAttachmentSize{
    _attachmentRowSpacing = 20;
    _attachmentColumnSpacing = 20;
    _rowAttachmentCount = 4;
    self.width = ScreenFullWidth - 8*2;
    self.attachmentWidth = (self.width - (_rowAttachmentCount+1)*self.attachmentColumnSpacing)/_rowAttachmentCount;
    self.attachmentHeight = self.attachmentWidth;
}

- (void)setUp {
    
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    [self setAttachmentSize];
    
    self.addAttachmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addAttachmentButton setBackgroundImage:[UIImage imageNamed:@"icon_upload_homework"] forState:UIControlStateNormal];
    self.addAttachmentButton.frame = CGRectMake(_attachmentColumnSpacing, _attachmentRowSpacing, _attachmentWidth, _attachmentHeight);
    [self.addAttachmentButton addTarget:self action:@selector(addAttach:) forControlEvents:UIControlEventTouchUpInside];
     self.attachmentsArray = @[self.addAttachmentButton].mutableCopy;
    [self reloadAttachments];
}

#pragma mark - action
- (void)addAttach:(UIButton *)button {
    
    if (self.addAttachmentBlock) {
        self.addAttachmentBlock(self);
    }
}

#pragma mark - addAttachment
- (void)addAttachmentWithImage:(UIImage *)image {
    
    AttachmentPhoto *attachment = [[AttachmentPhoto alloc] initWithFrame:CGRectMake(0, 0, self.addAttachmentButton.width, self.addAttachmentButton.height)];

    attachment.image = image    ;
    attachment.attachmentPhotodDeleteBlock = ^(AttachmentPhoto *attachment) {
        
        [self.attachmentsArray removeObject:attachment];
        [self reloadAttachments];
        if (self.deleteAttachmentBlock) {
            self.deleteAttachmentBlock(self);
        }
    };
    [self.attachmentsArray addObject:attachment];
    [self reloadAttachments];
}

#pragma mark - reload
- (void)reloadAttachments{
    
    if (self.subviews.count !=0) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    
    NSInteger columnCount = _rowAttachmentCount;
    NSInteger rowCount;
    if (self.attachmentsArray.count < columnCount) {
        rowCount = 1;
        columnCount = self.attachmentsArray.count;
    }else {
        rowCount = self.attachmentsArray.count / columnCount;
    }
    if (self.attachmentsArray.count %columnCount != 0 ||self.attachmentsArray.count/columnCount == 0) {
        rowCount++;
    }
    
    NSInteger index = 0;
    for (UIButton *attachment in self.attachmentsArray) {
        
        NSInteger row = index/columnCount;
        NSInteger col = index - row*columnCount;
       
        attachment.frame = CGRectMake(self.attachmentColumnSpacing +col*(self.addAttachmentButton.width+self.attachmentColumnSpacing), self.attachmentRowSpacing + row*(self.addAttachmentButton.height + self.attachmentRowSpacing), self.addAttachmentButton.width, self.addAttachmentButton.height);
        [self addSubview:attachment];
        index++;
    }
    self.rowCount = rowCount;
    self.height = (self.addAttachmentButton.height + _attachmentColumnSpacing)*rowCount + _attachmentRowSpacing;

}

- (CGFloat)height {
    
    return (self.addAttachmentButton.height + _attachmentRowSpacing)*self.rowCount + _attachmentRowSpacing;
}

@end
