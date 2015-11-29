//
//  WUButton.m
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "WUButton.h"

@interface WUButton () 
@property (nonatomic, strong) NSArray *imageNamedArr;
@end

@implementation WUButton

- (instancetype)initWithType:(WUButtonType)type title:(NSString *)title {
    if (self = [super init]) {
        
        _btnType = type;

        NSString *normalImage = [NSString stringWithFormat:@"%@_normal",self.imageNamedArr[type]];
        NSString *checkedImage = [NSString stringWithFormat:@"%@_checked",self.imageNamedArr[type]];
        [self setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:checkedImage] forState:UIControlStateSelected];
        
        
       
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self sizeToFit];
        
    }
    return self;
}

- (NSArray *)imageNamedArr {
    if (!_imageNamedArr) {
        _imageNamedArr = @[@"radio",@"chexbox"];
    }
    return _imageNamedArr;
}
@end
