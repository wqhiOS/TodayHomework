//
//  SelectSchoolButton.m
//  TodayHomework
//
//  Created by wuqh on 15/11/29.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "SelectSchoolButton.h"

@interface SelectSchoolButton ()

@property (nonatomic, strong) UIImageView *deleteImageView;

@end

@implementation SelectSchoolButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib {
    [self initialize];
}


- (void)initialize {
    
    [self addSubview:self.deleteImageView];
    self.backgroundColor = THGreenColor;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
}

- (UIImageView *)deleteImageView {
    if (!_deleteImageView) {
        _deleteImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_delete.png"]];
        _deleteImageView.frame = CGRectMake(0, 0, 12, 12);
    }
    return _deleteImageView;
}

- (void)setHideDeleteImage:(BOOL)hideDeleteImage {
    _hideDeleteImage = hideDeleteImage;
    [self.deleteImageView setHidden:hideDeleteImage];
}
@end
