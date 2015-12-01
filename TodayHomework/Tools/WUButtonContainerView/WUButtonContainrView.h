//
//  WUButtonContainrView.h
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WUButton.h"

typedef void (^ButtonClickBlockType)(WUButton *);

@interface WUButtonContainrView : UIView

@property (nonatomic, assign) CGFloat  rowSpacing;//行间距
@property (nonatomic, assign) CGFloat columnSpacing;//列间距

@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) WUButton *selectedRadioButton;
@property (nonatomic, strong) NSMutableArray *selectedMultipleButtons;

@property (nonatomic, copy) ButtonClickBlockType buttonClickBlock;

- (void)setUpWithTitles:(NSArray *)titles type:(WUButtonType)type width:(CGFloat)width finished:(void(^)(CGFloat))finish;

@end
