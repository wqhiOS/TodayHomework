//
//  UserTool.m
//  TodayHomework
//
//  Created by wuqh on 15/12/1.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "UserTool.h"

#define CZAccountFileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]
@implementation UserTool

//static UserModel *_user;
//
//+ (void)saveUser:(UserModel *)user
//{
//    [NSKeyedArchiver archiveRootObject:user toFile:CZAccountFileName];
//}
//
//+ (UserModel *)user
//{
//    if (!_user) {
//        
//        _user = [NSKeyedUnarchiver unarchiveObjectWithFile:CZAccountFileName];
//        
////        // 判断下账号是否过期，如果过期直接返回Nil
////        // 2015 < 2017
////        if ([[NSDate date] compare:_user.expires_date] != NSOrderedAscending) { // 过期
////            return nil;
////        }
//        
//    }
//    
//    
//    return _user;
//}
//
//+ (void)saveClasses:(NSMutableArray *)classes {
//    UserModel *user = [self user];
//    user.classes = classes;
//    [self saveUser:user];
//}


@end
