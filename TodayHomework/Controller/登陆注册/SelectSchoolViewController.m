//
//  SelectSchoolViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/11/29.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "SelectSchoolViewController.h"
#import "SelectSchoolHeaderView.h"

typedef NS_ENUM(NSInteger,SelectedState) {
    SelectedStateProvince,
    SelectedStateCity,
    SelectedStateArea,
    SelectedStateSchool
};

@interface SelectSchoolViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SelectSchoolHeaderView *selectSchoolHeaderView;
@property (nonatomic, strong) NSMutableArray *provinceArr;
@property (nonatomic, strong) NSMutableArray *cityArr;
@property (nonatomic, strong) NSMutableArray *areaArr;
@property (nonatomic, strong) NSMutableArray *schoolArr;
@property (nonatomic, assign) SelectedState selectedState;

@end

@implementation SelectSchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"选择学校";
    
    self.selectedState = SelectedStateProvince;
  
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.selectSchoolHeaderView];
    
    self.provinceArr = @[@"广东",@"上海",@"北京"].mutableCopy;
    
}


#pragma mark - getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 48, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.dataSource= self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    }
    return _tableView;
}

- (SelectSchoolHeaderView *)selectSchoolHeaderView {
    if (!_selectSchoolHeaderView) {
        _selectSchoolHeaderView = [SelectSchoolHeaderView selectSchoolHeaderView];
        _selectSchoolHeaderView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 48);
        
    }
    return _selectSchoolHeaderView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (self.selectedState) {
        case SelectedStateProvince:
        {
            return self.provinceArr.count;
        }
        case SelectedStateCity:
        {
            return self.cityArr.count;
        }
        case SelectedStateArea:
        {
            return self.areaArr.count;
        }
        case SelectedStateSchool:
        {
            return self.schoolArr.count;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    switch (self.selectedState) {
        case SelectedStateProvince:
        {
            cell.textLabel.text = self.provinceArr[indexPath.row];
        }
            break;
        case SelectedStateCity:
        {
            cell.textLabel.text = self.cityArr[indexPath.row];
        }
            break;
        case SelectedStateArea:
        {
            cell.textLabel.text = self.areaArr[indexPath.row];
        }
            break;
        case SelectedStateSchool:
        {
            cell.textLabel.text = self.schoolArr[indexPath.row];
        }
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (self.selectedState) {
        case SelectedStateProvince:
        {
            self.selectedState = SelectedStateCity;
            self.cityArr = @[@"郑州",@"南阳",@"开封"].mutableCopy;
            [self.tableView reloadData];
            
            [self.selectSchoolHeaderView.provinceBtn setTitle:self.provinceArr[indexPath.row] forState:UIControlStateNormal];
            self.selectSchoolHeaderView.provinceBtn.hideDeleteImage = NO;
            self.selectSchoolHeaderView.provinceBtn.enabled = YES;
            [self.selectSchoolHeaderView.provinceBtn addTarget:self action:@selector(provinceBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
        case SelectedStateCity:
        {
            self.selectedState = SelectedStateArea;
            self.areaArr = @[@"宛城区",@"卧龙区",@"邓州市"].mutableCopy;
            [self.tableView reloadData];
            
            [self.selectSchoolHeaderView.cityBtn setTitle:self.cityArr[indexPath.row] forState:UIControlStateNormal];
            self.selectSchoolHeaderView.cityBtn.hidden = NO;
            [self.selectSchoolHeaderView.cityBtn addTarget:self action:@selector(cityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            self.selectSchoolHeaderView.provinceBtn.enabled = NO;
        }
            break;
        case SelectedStateArea:
        {
            self.selectedState = SelectedStateSchool;
            self.schoolArr = @[@"第一小学",@"第二小学",@"第三小学"].mutableCopy;
            [self.tableView reloadData];
            
            self.selectSchoolHeaderView.areaBtn.hidden = NO;
            [self.selectSchoolHeaderView.areaBtn addTarget:self action:@selector(areaBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.selectSchoolHeaderView.areaBtn setTitle:self.areaArr[indexPath.row] forState:UIControlStateNormal];
            self.selectSchoolHeaderView.cityBtn.enabled = NO;
        }
            break;
        case SelectedStateSchool:
        {
            
            if (self.selecteSchool) {
                self.selecteSchool(self.schoolArr[indexPath.row]);
            }
            [self.navigationController popViewControllerAnimated:YES];
            
        }
            break;
    }
}

#pragma mark - action
- (void)provinceBtnClick:(SelectSchoolButton *)button {
    [button setTitle:@"选择城市" forState:UIControlStateNormal];
    button.hideDeleteImage = YES;
    button.enabled = NO;
    self.selectedState = SelectedStateProvince;
    [self.tableView reloadData];
}

- (void)cityBtnClick:(SelectSchoolButton *)button {
    self.selectSchoolHeaderView.provinceBtn.enabled = YES;
    button.hidden = YES;
    self.selectedState = SelectedStateCity;
    [self.tableView reloadData];
}

- (void)areaBtnClick:(SelectSchoolButton *)button {
    button.hidden = YES;
    self.selectSchoolHeaderView.cityBtn.enabled = YES;
    self.selectedState = SelectedStateArea;
    [self.tableView reloadData];
}


@end
