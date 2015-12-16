//
//  WUPopView.m
//  TodayHomework
//
//  Created by wuqh on 15/12/15.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "WUPopView.h"
#import "WUPopViewDataSource.h"
#import "Masonry.h"

@interface WUPopView()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;


@end

@implementation WUPopView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(SCREEN_WIDTH-15, 60, 10, 10);
        self.image = [[UIImage imageNamed:@"bg_more"] resizableImageWithCapInsets:UIEdgeInsetsMake(22, 1, 1, 80)];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
//        WUPopViewDataSource *dataSource = [[WUPopViewDataSource alloc] initWithTableView:_tableView];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 35;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    }
    return _tableView;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];;
        _bgView.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}

- (void)show {
    
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(17);
        make.right.left.bottom.equalTo(self);
    }];
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self.bgView];
    [keyWindow addSubview:self];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.superview).offset(-5);
        make.top.equalTo(self.superview).offset(60);
        make.width.equalTo(@180);
        make.height.equalTo(@190);
        
    }];
    [UIView animateWithDuration:0.3 animations:^{
         [self layoutIfNeeded];
    }];
    [self.tableView reloadData];

}

- (void)tap {
    [_bgView removeFromSuperview];
    [self mas_updateConstraints:^(MASConstraintMaker *make) {

        make.width.equalTo(@0);
        make.height.equalTo(@0);
        
    }];
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = @[@{@"title":@"添加学生",@"img":@"icon_xsgl_03"}
                     ,@{@"title":@"删除学生",@"img":@"ios-1_06"}
                     ,@{@"title":@"修改学生密码",@"img":@"icon_xsgl_08"}
                     ,@{@"title":@"下载学生信息",@"img":@"icon_xsgl_11"}
                     ,@{@"title":@"修改学生联系电话",@"img":@"icon_xsgl_15"}];
    }
    return _dataArr;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:self.dataArr[indexPath.row][@"img"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.dataArr[indexPath.row][@"title"];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}


@end
