//
//  ClassManageDataSource.m
//  TodayHomework
//
//  Created by wuqh on 15/12/11.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "ClassManageDataSource.h"
#import "ClassManageCell.h"
#import "ClassManageSubCell.h"
#import "ModifyClassInfoViewController.h"
#import "ClassManageStudentViewController.h"
#import "ClassManageTeacherViewController.h"
#import "ClassInfoModel.h"

@interface ClassManageDataSource()
{
    UITableView *_tableView;
}

@end

@implementation ClassManageDataSource

static NSString *cellId = @"cellId";
static NSString *subCellId = @"subCellId";
- (instancetype)initWithTableView:(UITableView *)tableView {
    if (self = [super init]) {
        _tableView = tableView;
       
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ClassManageCell class]) bundle:nil] forCellReuseIdentifier:cellId];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ClassManageSubCell class]) bundle:nil] forCellReuseIdentifier:subCellId];
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.classes.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        ClassManageCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        cell.classInfo = self.classes[indexPath.section];
       
        return cell;
    }else {
        ClassManageSubCell* subCell = [tableView dequeueReusableCellWithIdentifier:subCellId forIndexPath:indexPath];
        subCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
         subCell.tintColor = [UIColor redColor];
        [subCell setClassInfo:self.classes[indexPath.section] type:indexPath.row];
        return subCell;
    }

}

#pragma mark - UITableViewDelegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ClassInfoModel *classInfo = self.classes[indexPath.section];
    switch (indexPath.row) {
        case 0:
        {
            if ([self.delegate respondsToSelector:@selector(classManagePushSubViewController:)]) {
                ModifyClassInfoViewController *vc = [[ModifyClassInfoViewController alloc] init];
                vc.classInfo = classInfo;
                vc.hidesBottomBarWhenPushed = YES;
                [self.delegate classManagePushSubViewController:vc];
            }
        }
            break;
        case 1:
        {
            if ([self.delegate respondsToSelector:@selector(classManagePushSubViewController:)]) {
                ClassManageStudentViewController *vc = [[ClassManageStudentViewController alloc] initWithClassId:classInfo.id];
                vc.hidesBottomBarWhenPushed = YES;
                [self.delegate classManagePushSubViewController:vc];
            }
        }
            break;
        case 2:
        {
            if ([self.delegate respondsToSelector:@selector(classManagePushSubViewController:)]) {
                ClassManageTeacherViewController *vc = [[ClassManageTeacherViewController alloc] init];
                vc.classInfo = self.classes[indexPath.section];
                vc.hidesBottomBarWhenPushed = YES;
                [self.delegate classManagePushSubViewController:vc];
            }
        }
            break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

@end
