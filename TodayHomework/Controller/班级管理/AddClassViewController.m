//
//  AddClassViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/11/30.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "AddClassViewController.h"
#import "AddClassCell.h"
#import "OtherClassCell.h"
#import "THSubmitButton.h"
#import "UserTool.h"

@interface AddClassViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *cellArr;
@property (nonatomic, strong) AddClassCell *educationStageCell;
@property (nonatomic, strong) AddClassCell *educationSystemCell;
@property (nonatomic, strong) AddClassCell *gradeCell;
@property (nonatomic, strong) AddClassCell *classCell;
@property (nonatomic, strong) OtherClassCell *otherClassCell;
@property (nonatomic, strong) AddClassCell *myClassCell;
@property (nonatomic, strong) THSubmitButton *nextStepButton;

@end


@implementation AddClassViewController

static NSString *cellId = @"AddClassCellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"添加班级";
    [self.view addSubview:self.tableView];
    self.cellArr = @[self.educationStageCell,self.educationSystemCell,self.gradeCell,self.classCell,self.otherClassCell,self.myClassCell];
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
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.allowsSelection = NO;
        
        UIView *tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 70)];
        [tableFooterView addSubview:self.nextStepButton];
        _tableView.tableFooterView = tableFooterView;
        
    }
    return _tableView;
}

- (THSubmitButton *)nextStepButton {
    if (!_nextStepButton) {
        _nextStepButton = [[THSubmitButton alloc] init];
        [_nextStepButton setTitle:@"下一步" forState:UIControlStateNormal];
        _nextStepButton.frame = CGRectMake(8, 20, SCREEN_WIDTH-16, 48);

        [_nextStepButton addTarget:self action:@selector(nextStep:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextStepButton;
}

#pragma mark - action
- (void)nextStep:(WUButton *)sender {
    
//    NSString *educationStage = self.educationStageCell.containerView.selectedRadioButton.currentTitle;
//    NSString *grade = self.gradeCell.containerView.selectedRadioButton.currentTitle;
//    
//    NSMutableArray *classArr = @[].mutableCopy;
//    for (WUButton *button in self.classCell.containerView.selectedMultipleButtons) {
//        [classArr addObject:[NSString stringWithFormat:@"%@%@%@",educationStage,grade,button.currentTitle]];
//    }
//    
//    [UserTool saveClasses:classArr];
    
}

#pragma mark - cell 初始化
- (AddClassCell *)educationStageCell {
    if (!_educationStageCell) {
        _educationStageCell = [AddClassCell addClassCell];
        _educationStageCell.containerView.buttonClickBlock = ^ (WUButton *selectBtn){
            
            if ([selectBtn.currentTitle isEqualToString:@"小学"]) {
                [self.educationSystemCell.containerView setUpWithTitles:@[@"五年制",@"六年制"] type:WUButtonTypeRadio width:_educationSystemCell.containerWidth  finished:^(CGFloat height) {
                    _educationSystemCell.containerHeight.constant = height;
                
                }];
                [self.gradeCell.containerView setUpWithTitles:@[@"一年级",@"二年级",@"三年级",@"四年级",@"五年级"] type:WUButtonTypeRadio width:_gradeCell.containerWidth finished:^(CGFloat height) {
                    _gradeCell.containerHeight.constant = height;
          
                }];
            }else if([selectBtn.currentTitle isEqualToString:@"初中"]) {
                [self.educationSystemCell.containerView setUpWithTitles:@[@"三年制",@"四年制"] type:WUButtonTypeRadio width:_educationSystemCell.containerWidth  finished:^(CGFloat height) {
                    _educationSystemCell.containerHeight.constant = height;
               
                }];
                [self.gradeCell.containerView setUpWithTitles:@[@"一年级",@"二年级",@"三年级"] type:WUButtonTypeRadio width:_gradeCell.containerWidth finished:^(CGFloat height) {
                    _gradeCell.containerHeight.constant = height;
                    
                }];
            }else {
                [self.educationSystemCell.containerView setUpWithTitles:@[@"三年制"] type:WUButtonTypeRadio width:_educationSystemCell.containerWidth  finished:^(CGFloat height) {
                    _educationSystemCell.containerHeight.constant = height;
                  
                }];
                [self.gradeCell.containerView setUpWithTitles:@[@"一年级",@"二年级",@"三年级"] type:WUButtonTypeRadio width:_gradeCell.containerWidth finished:^(CGFloat height) {
                    _gradeCell.containerHeight.constant = height;
                
                }];
            }
            [self.tableView reloadData];
            
            
        };
        _educationStageCell.addClassState = AddClassStateEducationalStage;
    }
    return _educationStageCell;
}

- (AddClassCell *)educationSystemCell {
    if (!_educationSystemCell) {
        _educationSystemCell = [AddClassCell addClassCell];
        _educationSystemCell.containerView.buttonClickBlock = ^ (WUButton *selectBtn){
            
        };
        _educationSystemCell.addClassState = AddClassStateEducationalSystem;
    }
    return _educationSystemCell;
}

- (AddClassCell *)gradeCell {
    if (!_gradeCell) {
        _gradeCell = [AddClassCell addClassCell];
        _gradeCell.containerView.buttonClickBlock = ^ (WUButton *selectBtn){
            
        };
        _gradeCell.addClassState = AddClassStateGrade;
    }
    return _gradeCell;
}

- (AddClassCell *)classCell {
    if (!_classCell) {
        _classCell = [AddClassCell addClassCell];
        _classCell.containerView.buttonClickBlock = ^ (WUButton *selectBtn){
            
        };
        _classCell.addClassState = AddClassStateClass;
    }
    return _classCell;
}

- (OtherClassCell *)otherClassCell {
    if (!_otherClassCell) {
        _otherClassCell = [OtherClassCell otherClassCell];
    }
    return _otherClassCell;
}

- (AddClassCell *)myClassCell {
    if (!_myClassCell) {
        _myClassCell = [AddClassCell addClassCell];
        _myClassCell.addClassState = AddClassStateMyClass;
    }
    return _myClassCell;
}



@end
