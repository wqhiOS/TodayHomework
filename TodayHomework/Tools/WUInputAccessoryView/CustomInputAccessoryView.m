//
//  CustomInputAccessoryView.m
//  XSD
//
//  Created by wuqh on 15/9/11.
//  Copyright (c) 2015年 SL. All rights reserved.
//

#import "CustomInputAccessoryView.h"

@implementation CustomInputAccessoryView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
        UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)];
        UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        self.items = @[leftBarButtonItem,flexible,rightBarButtonItem];
        self.backgroundColor = [UIColor grayColor];
    }
    
    return self;
}

- (void)cancel:(UIBarButtonItem *)item {
    if ([self.customDelegate respondsToSelector:@selector(customInputAccessoryViewCancel)]) {
        [self.customDelegate customInputAccessoryViewCancel];
    }
}

- (void)confirm:(UIBarButtonItem *)item {
    if ([self.customDelegate respondsToSelector:@selector(customInputAccessoryViewConfirm)]) {
        [self.customDelegate customInputAccessoryViewConfirm];
    }
}

@end
