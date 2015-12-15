//
//  HomeworkDetailViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/12/7.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "HomeworkDetailViewController.h"
#import "CheckAttachmentContainerView.h"
#import "BrowsePictureViewController.h"


@interface HomeworkDetailViewController ()<CheckAttachemtnDelegate>

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

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *homeworkContentLabelWidthConstraint;

@end

@implementation HomeworkDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.homeworkContentLabelWidthConstraint.constant = SCREEN_WIDTH - 138 -30;
    self.scrollViewWidthConstraint.constant = SCREEN_WIDTH;
    self.title = @"查看作业";
    [self updateUI];
    
}

- (void)updateUI {
    self.startDateLabel.text = self.status.busyworkInfo.startDate;
    self.endDateLabel.text = self.status.busyworkInfo.endDate;
    self.gradeLabel.text = [NSString stringWithFormat:@"%@%@%@",self.status.classesInfo.educationStage,self.status.classesInfo.gradeId,self.status.classesInfo.classedId];
    self.homeworkContentLabel.text = self.status.busyworkInfo.busyworkMessage;
    
    self.homeworkAttachmentsContainerView.containerViewWidth = SCREEN_WIDTH;
    self.homeworkAttachmentsContainerView.delegate = self;
    self.homeworkAttachmentsContainerView.updateHeight = ^(CGFloat height) {
        self.homeworkAttachmentsViewHeightConstraint.constant = height;
    };
    self.homeworkAttachmentsContainerView.attachmentInfos = self.status.listAttachmentInfowork;
    
    
    self.answerAttachmentsContainerView.containerViewWidth = SCREEN_WIDTH;
    self.answerAttachmentsContainerView.delegate = self;
    self.answerAttachmentsContainerView.updateHeight = ^(CGFloat height) {
        self.answerAttachmentsViewHeightConstraint.constant = height;
    };
    self.answerAttachmentsContainerView.attachmentInfos  = self.status.listAttachmentInfoANSWER;
    
    
}

#pragma mark - CheckAttachmentDelegate
- (void)checkAttachment:(Attachment *)attachment {
    BrowsePictureViewController *vc = [[BrowsePictureViewController alloc] initWithAttachmentInfos:self.status.listAttachmentInfowork index:1];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
