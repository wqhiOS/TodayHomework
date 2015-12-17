//
//  WUPopView.h
//  TodayHomework
//
//  Created by wuqh on 15/12/15.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WUPopView;

@protocol WUPopViewDelegate <NSObject>

- (void)popView:(WUPopView *)popView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface WUPopView : UIImageView

@property (nonatomic, weak) id<WUPopViewDelegate> delegate;

- (void)show;

@end
