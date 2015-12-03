//
//  ParamInfoModel.h
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BaseModel.h"

@interface ParamInfoModel : BaseModel<NSCoding>

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *paramName;

@end
