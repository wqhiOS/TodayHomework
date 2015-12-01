//
//  PublishHomeworkViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/12/1.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "PublishHomeworkViewController.h"

#import "AddClassCell.h"
#import "TextFieldCell.h"

@interface PublishHomeworkViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) TextFieldCell *startDate;
@property (nonatomic, strong) TextFieldCell *endDate;
@property (nonatomic, strong) AddClassCell *gradeCell;
@property (nonatomic, strong) AddClassCell *classCell;
@property (nonatomic, strong) AddClassCell *subjectCell;
@property (nonatomic, strong) TextFieldCell *homeworkContentCell;
@property (nonatomic, strong) NSArray *cellArr;
@end

@implementation PublishHomeworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"发布作业";
    
    self.cellArr = @[self.startDate,self.endDate,self.gradeCell,self.classCell,self.subjectCell,self.homeworkContentCell];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellArr[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellArr[indexPath.row] cellHeight];
}



#pragma mark - getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (TextFieldCell *)startDate {
    if (!_startDate) {
        _startDate = [TextFieldCell textFiledCell];
    }
    return _startDate;
}

- (TextFieldCell *)endDate {
    if (!_endDate) {
        _endDate = [TextFieldCell textFiledCell];
    }
    return _endDate;
}

- (AddClassCell *)gradeCell {
    if (!_gradeCell) {
        _gradeCell = [AddClassCell addClassCell];
        _gradeCell.titleLabel.text = @"选择年级";
      
        _gradeCell.containerView.buttonClickBlock = ^(WUButton* button) {
            
            if ([button.currentTitle isEqualToString:@"小学一年级"]) {
                
                [self.classCell.containerView setUpWithTitles:@[@"1班",@"2班"] type:WUButtonTypeMultiple width:self.classCell.containerWidth finished:^(CGFloat height) {
                    self.classCell.containerHeight.constant = height;
                }];
                
            }else {
                [self.classCell.containerView setUpWithTitles:@[@"1班",@"2班",@"3班",@"4班",@"5班",@"6班",@"7班",@"8班",@"9班",] type:WUButtonTypeMultiple width:self.classCell.containerWidth finished:^(CGFloat height) {
                    self.classCell.containerHeight.constant = height;
                }];
            }
            
            [self.tableView reloadData];
        };
        
        [_gradeCell.containerView setUpWithTitles:@[@"小学一年级",@"小学二年级"] type:WUButtonTypeRadio width:_gradeCell.containerWidth finished:^(CGFloat height) {
            _gradeCell.containerHeight.constant = height;
            
        }];
        

        
    }
    return _gradeCell;
}

- (AddClassCell *)classCell {
    if (!_classCell) {
        
        _classCell = [AddClassCell addClassCell];
        _classCell.titleLabel.text = @"选择班级";
    }
    return _classCell;
}

- (AddClassCell *)subjectCell {
    if (!_subjectCell) {
       
        _subjectCell = [AddClassCell addClassCell];
         _subjectCell.titleLabel.text = @"选择科目";
    }
    return _subjectCell;
}

- (TextFieldCell *)homeworkContentCell {
    if (!_homeworkContentCell) {
        _homeworkContentCell = [TextFieldCell textFiledCell];
    }
    return _homeworkContentCell;
}


@end
