//
//  UserTool.h
//  TodayHomework
//
//  Created by wuqh on 15/12/1.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface UserTool : NSObject


+ (void)saveUser:(UserModel *)user;
+ (UserModel *)user;

+ (void)saveClasses:(NSMutableArray *)classes;
@end
