//
//  WUPopTableViewDataSource.h
//  TodayHomework
//
//  Created by wuqh on 15/12/15.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WUPopViewDataSource : NSObject<UITableViewDataSource,UITableViewDelegate>

- (instancetype)initWithTableView:(UITableView *)tableView;

@end
