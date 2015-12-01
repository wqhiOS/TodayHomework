//
//  UserModel.h
//  TodayHomework
//
//  Created by wuqh on 15/12/1.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, strong) NSMutableArray *classes;

@end
