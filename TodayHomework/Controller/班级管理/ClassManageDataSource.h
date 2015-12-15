//
//  ClassManageDataSource.h
//  TodayHomework
//
//  Created by wuqh on 15/12/11.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaseViewController;
@protocol ClassManageDelegate <NSObject>

- (void)classManagePushSubViewController:(BaseViewController *)vc;


@end

@interface ClassManageDataSource : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) id<ClassManageDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *classes;

- (instancetype)initWithTableView:(UITableView *)tableView;

@end
