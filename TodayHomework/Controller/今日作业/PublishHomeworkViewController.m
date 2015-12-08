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
#import "UserInfoHandle.h"
#import "ClassInfoModel.h"
#import "AddAttachmentCell.h"
#import "HomeworkContentCell.h"
#import "PublishHomeworkHeaderView.h"

@interface PublishHomeworkViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) TextFieldCell *startDate;
@property (nonatomic, strong) TextFieldCell *endDate;
@property (nonatomic, strong) AddClassCell *gradeCell;
@property (nonatomic, strong) AddClassCell *classCell;
@property (nonatomic, strong) AddClassCell *subjectCell;
@property (nonatomic, strong) HomeworkContentCell *homeworkContentCell;
@property (nonatomic, strong) AddAttachmentCell *addAttachmentCell;
@property (nonatomic, strong) PublishHomeworkHeaderView *publishHomeworkHeaderView;
@property (nonatomic, strong) NSArray *cellArr;
@property (nonatomic, strong) NSDictionary *subjects;

/**
 *  班级模型
 */
@property (nonatomic, strong) NSArray *classes;

@property (nonatomic, strong) NSMutableSet *gradeTitles;
@property (nonatomic, strong) NSMutableArray *classTitles;

/**
 *  班级id拼接的字符串
 */
@property (nonatomic, copy) NSString *classIdsStr;
@end

@implementation PublishHomeworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"发布作业";
    
    self.cellArr = @[self.startDate,self.endDate,self.gradeCell,self.classCell,self.subjectCell,self.homeworkContentCell,self.addAttachmentCell];
    [self.view addSubview:self.tableView];
    [self loadClasses];
}

#pragma mark - 获取教师的所有班级信息
- (void)loadClasses {
    [UserInfoHandle classesByTeacerSuccess:^(id obj) {
        self.classes = obj;
        for (ClassInfoModel *classInfo in self.classes) {
            NSString *gradeName = [NSString stringWithFormat:@"%@%@",classInfo.educationStage,classInfo.gradeId];
            [self.gradeTitles addObject:gradeName];
        }
        //加载年级
        [self.gradeCell.containerView setUpWithTitles:self.gradeTitles.allObjects type:WUButtonTypeRadio width:self.gradeCell.containerWidth finished:^(CGFloat height) {
            self.gradeCell.containerHeight.constant = height;
        }];
    } failed:^(id obj) {
        
    }];
}

#pragma mark - 发布作业
- (void)publishHomework {
   
    NSArray *attachments = self.addAttachmentCell.attachmentContainerView.attachmentsArray;
    NSMutableArray *imgs = @[].mutableCopy;

    for (int i = 1; i<attachments.count; i++) {
        [imgs addObject:[attachments[i] image]];
    }
   
    [UserInfoHandle publishHomework:self.classIdsStr startDate:self.startDate.dateTextField.text endDate:self.endDate.dateTextField.text courseId:self.subjects[self.subjectCell.containerView.selectedRadioButton.currentTitle] memo:self.homeworkContentCell.textView.text attachments:imgs success:^(id obj) {
        
    } failed:^(id obj) {
        
    }];
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

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    UIImagePickerControllerSourceType sourceType;
    
    switch (buttonIndex) {
        case 0:
        {
            sourceType = UIImagePickerControllerSourceTypeCamera;
        }
            break;
        case 1:
        {
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
            break;
        case 2:
        {
            return;
        }
        default:
            break;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = sourceType;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    
    //页面展示：
    [self.addAttachmentCell.attachmentContainerView addAttachmentWithImage:info[UIImagePickerControllerOriginalImage]];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.allowsSelection = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = self.publishHomeworkHeaderView;
    }
    return _tableView;
}

- (TextFieldCell *)startDate {
    if (!_startDate) {
        _startDate = [TextFieldCell textFiledCell];
        _startDate.titleLabel.text = @"开始时间";
    }
    return _startDate;
}

- (TextFieldCell *)endDate {
    if (!_endDate) {
        _endDate = [TextFieldCell textFiledCell];
        _endDate.titleLabel.text = @"结束时间";
    }
    return _endDate;
}

- (AddClassCell *)gradeCell {
    if (!_gradeCell) {
        _gradeCell = [AddClassCell addClassCell];
        _gradeCell.titleLabel.text = @"选择年级";
      
        _gradeCell.containerView.buttonClickBlock = ^(WUButton* button) {
            
            NSString *gradeName = button.currentTitle;
            [self.classTitles removeAllObjects];
            for (ClassInfoModel *classInfo in self.classes) {
                NSString *name = [NSString stringWithFormat:@"%@%@",classInfo.educationStage,classInfo.gradeId];
                if ([name isEqualToString:gradeName]) {
                    [self.classTitles addObject:classInfo.classedId];
                }
            }
            [self.classCell.containerView setUpWithTitles:self.classTitles type:WUButtonTypeMultiple width:self.classCell.containerWidth finished:^(CGFloat height) {
                self.classCell.containerHeight.constant = height;
            }];
           

            [self.tableView reloadData];
        };
    }
    return _gradeCell;
}

- (AddClassCell *)classCell {
    if (!_classCell) {
        
        _classCell = [AddClassCell addClassCell];
        _classCell.titleLabel.text = @"选择班级";
        _classCell.containerView.buttonClickBlock = ^ (WUButton* button){
            
            NSMutableArray *classIds = @[].mutableCopy;
            NSString *gradeName = self.gradeCell.containerView.selectedRadioButton.currentTitle;
            
            for (WUButton *button in self.classCell.containerView.selectedMultipleButtons) {
                
                for (ClassInfoModel *classInfo in self.classes) {
                 
                    NSString *className = button.currentTitle;
                    NSString *name = [NSString stringWithFormat:@"%@%@%@",classInfo.educationStage,classInfo.gradeId,classInfo.classedId];
                   
                    if ([name isEqualToString:[gradeName stringByAppendingString:className]]) { //找到对应的model
                        //保存classId
                        [classIds addObject:classInfo.id];
                    }
                }
                
            }
            self.classIdsStr = [classIds componentsJoinedByString:@","];
            [UserInfoHandle subjectsByClasses:self.classIdsStr Success:^(id obj) {
                self.subjects = obj;
                [self.subjectCell.containerView setUpWithTitles:self.subjects.allKeys type:WUButtonTypeRadio width:self.subjectCell.containerWidth finished:^(CGFloat height) {
                    if (height == 20) {
                        height =38;
                    }
                    self.subjectCell.containerHeight.constant = height;
                }];
                [self.tableView reloadData];
            } failed:^(id obj) {
                
            }];
            
        };
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

- (HomeworkContentCell *)homeworkContentCell {
    if (!_homeworkContentCell) {
        _homeworkContentCell = [HomeworkContentCell homeworkContentCell];
    }
    return _homeworkContentCell;
}

- (AddAttachmentCell *)addAttachmentCell {
    if (!_addAttachmentCell) {
        _addAttachmentCell = [AddAttachmentCell addAttachmentCell];
        _addAttachmentCell.attachmentContainerView.addAttachmentBlock = ^ (AttachmentContainerView *attachmentContainerView){
            
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"上传方式" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"打开相机",@"打开相册", nil];
            [actionSheet showInView:self.view];
            
        };
        _addAttachmentCell.attachmentContainerView.deleteAttachmentBlock = ^ (AttachmentContainerView *attachmentContainerView){
            [self.tableView reloadData];
        };

    }
    return _addAttachmentCell;
}

- (PublishHomeworkHeaderView *)publishHomeworkHeaderView {
    if (!_publishHomeworkHeaderView) {
        _publishHomeworkHeaderView = [[PublishHomeworkHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
        __weak typeof(self) weakSelf = self;
        _publishHomeworkHeaderView.publishHomework = ^ (THSubmitButton *button){
            [weakSelf publishHomework];
        };
    }
    return _publishHomeworkHeaderView;
}

- (NSMutableSet*)gradeTitles {
    if (!_gradeTitles) {
        _gradeTitles = [[NSMutableSet alloc] initWithCapacity:0];;
    }
    return _gradeTitles;
}

- (NSMutableArray *)classTitles {
    if (!_classTitles) {
        _classTitles = [NSMutableArray array];
    }
    return _classTitles;
}


@end
