//
//  WUButton.h
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WUButtonType) {
    WUButtonTypeRadio,
    WUButtonTypeMultiple
};

@interface WUButton : UIButton

@property (nonatomic, assign) WUButtonType btnType;

- (instancetype)initWithType:(WUButtonType)type title:(NSString *)title;

@end
