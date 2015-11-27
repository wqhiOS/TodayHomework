//
//  Constants.h
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

/****** 屏幕尺寸 *******/
#define SCREEN_BOUNDS [[UIScreen mainScreen] bounds]
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width   

/******** 颜色 ********/
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define THGreenColor [UIColor colorWithRed:0.4039 green:0.749 blue:0.1255 alpha:1]
#define THTfBackgroundColor [UIColor colorWithRed:1 green:0.9333 blue:0.898 alpha:1]

/******* 所有科目 *******/
#define ALL_SUBJECTS [NSMutableArray arrayWithObjects:@"语文",@"数学",@"化学",@"生物",@"英语",@"历史",@"地理",@"政治",@"物理",@"其他",, nil]


#endif
