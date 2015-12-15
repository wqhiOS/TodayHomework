//
//  ModifyClassInfoViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/12/11.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "ModifyClassInfoViewController.h"
#import "ClassInfoModel.h"
#import "ClassManageSelectSubjectView.h"
#import "UserInfoTool.h"
#import "UserInfoHandle.h"

@interface ModifyClassInfoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *classInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;

@property (weak, nonatomic) IBOutlet ClassManageSelectSubjectView *selectSubjectView;

@end

@implementation ModifyClassInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"修改信息";
    
    self.classInfoLabel.backgroundColor = THTfBackgroundColor;
    self.subjectLabel.backgroundColor = THTfBackgroundColor;
    self.classLabel.backgroundColor = THTfBackgroundColor;
    self.selectSubjectView.backgroundColor = THTfBackgroundColor;
    
    [self updateUI];
}

- (void)updateUI {
    self.classLabel.text = [NSString stringWithFormat:@"%@%@%@",self.classInfo.educationStage,self.classInfo.gradeId,self.classInfo.classedId];
    
    [self.selectSubjectView setTeacherSubjects:[self teacherSubject] selectedSubjects:self.classInfo.teachersource];
    
}

- (NSDictionary *)teacherSubject{
    NSMutableDictionary *teacherSubject = @{}.mutableCopy;
    UserInfoModel *userInfo = [UserInfoTool userInfo];
    [userInfo.paramList enumerateObjectsUsingBlock:^(ParamInfoModel *paramInfo, NSUInteger idx, BOOL * _Nonnull stop) {
        [teacherSubject setObject:paramInfo.id forKey:paramInfo.paramName];
    }];
    return teacherSubject;
}


#pragma mark - action
- (IBAction)save:(id)sender {
    DLog(@"%@",self.selectSubjectView.selectedSubjectsId);
    DLog(@"%@",[self.selectSubjectView.subjectsDict.allValues componentsJoinedByString:@","]);
    
    [UserInfoHandle updateSubjectsBySubjectsId:self.selectSubjectView.selectedSubjectsId
                                 oldSubjectsId:[self.selectSubjectView.subjectsDict.allValues componentsJoinedByString:@","]
                                       classId:self.classInfo.id success:^(id obj) {
                                           
                                           DLog(@"%@",obj);
                                           [self.navigationController popViewControllerAnimated:YES];
                                           [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_UPDATE_CLASSINFO object:nil];
                                       } failed:^(id obj) {
                                           
                                       }];
}
- (IBAction)cancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
