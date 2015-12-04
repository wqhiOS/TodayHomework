//
//  HomeCell.m
//  TodayHomework
//
//  Created by wuqh on 15/12/4.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "HomeCell.h"
#import "NSString+Date.h"
#import "AppUtils.h"

@interface HomeCell()

@property (weak, nonatomic) IBOutlet UILabel *endDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeworkContentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImg;

@property (nonatomic, strong) NSArray *imgArr;


@end

@implementation HomeCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 *  点击查看作业详情按钮
 *
 *  @param sender 作业详情按钮
 */
- (IBAction)homeworkDetail:(id)sender {
    if (self.homeworkDetailBlock) {
        self.homeworkDetailBlock();
    }
}

/**
 *  查看情况
 *
 *  @param sender 查看情况按钮
 */
- (IBAction)checkHomeworkSituation:(id)sender {
    if (self.checkHomeworkSituation) {
        self.checkHomeworkSituation();
    }
}

- (void)setStatus:(HomeworkStatusModel *)status {
    _status = status;
    _homeworkContentLabel.text = status.busyworkInfo.busyworkMessage;
    _classLabel.text = [NSString stringWithFormat:@"%@%@%@",status.classesInfo.educationStage,status.classesInfo.gradeId,status.classesInfo.classedId];

    NSDate *date = [AppUtils dateFromString:status.busyworkInfo.startDate formatter:@"yyyy-MM-dd"];
    _endDateLabel.text = [NSString stringWithFormat:@"%@(%@)",status.busyworkInfo.startDate,[AppUtils weekdayStringFromDate:date] ];
   
    
    NSInteger courseId = [status.busyworkInfo.courseId integerValue]-1;
    NSString *imageName = self.imgArr[courseId];
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat h = image.size.height*0.5;
    self.backgroundImg.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(h, 50, h, 20) resizingMode:UIImageResizingModeStretch];;
    
    
}

- (void)setBackgroundImageWithSubject:(NSString *)subject {
    
}

- (NSArray *)imgArr {
    if (!_imgArr) {
        _imgArr = @[@"bg_chinese_item",@"bg_math_item",@"bg_chemistry_item",@"bg_biology_item",@"bg_english_item",@"bg_history_item",@"bg_geography_item",@"bg_politics_item",@"bg_physics_item",@"bg_others_item"];
    }
    return _imgArr;
}



@end
