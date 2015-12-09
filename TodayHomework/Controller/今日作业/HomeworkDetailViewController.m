//
//  HomeworkDetailViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/12/7.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "HomeworkDetailViewController.h"
#import "CheckAttachmentContainerView.h"


@interface HomeworkDetailViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *endDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeworkContentLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewWidthConstraint;

@property (weak, nonatomic) IBOutlet CheckAttachmentContainerView *homeworkAttachmentsContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *homeworkAttachmentsViewHeightConstraint;
@property (weak, nonatomic) IBOutlet CheckAttachmentContainerView *answerAttachmentsContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *answerAttachmentsViewHeightConstraint;


@end

@implementation HomeworkDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    self.scrollViewWidthConstraint.constant = SCREEN_WIDTH - 8*2;
    self.title = @"查看作业";
    [self updateUI];
    
}

- (void)updateUI {
    self.startDateLabel.text = self.status.busyworkInfo.startDate;
    self.endDateLabel.text = self.status.busyworkInfo.endDate;
    self.gradeLabel.text = [NSString stringWithFormat:@"%@%@%@",self.status.classesInfo.educationStage,self.status.classesInfo.gradeId,self.status.classesInfo.classedId];
    self.homeworkContentLabel.text = self.status.busyworkInfo.busyworkMessage;
    self.homeworkAttachmentsContainerView.updateHeight = ^(CGFloat height) {
        NSLog(@"%f",height);
        self.homeworkAttachmentsViewHeightConstraint.constant = height;
    };
    self.homeworkAttachmentsContainerView.attachmentInfos = self.status.listAttachmentInfowork;
    self.answerAttachmentsContainerView.updateHeight = ^(CGFloat height) {
        NSLog(@"%f",height);
        self.answerAttachmentsViewHeightConstraint.constant = height;
    };
    self.answerAttachmentsContainerView.attachmentInfos  = self.status.listAttachmentInfoANSWER;
    
    
}

@end
