//
//  PersonalCenterSubItemCell.m
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "PersonalCenterSubItemCell.h"
#import "UserInfoTool.h"

@interface PersonalCenterSubItemCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *completeIcon;

@end

@implementation PersonalCenterSubItemCell

+ (instancetype)personalCenterSubItemCell {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    // Initialization code
    self.subTitleLabel.hidden = YES;
    self.completeIcon.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateUIWithDictionary:(NSDictionary *)dict withIndexPath:(NSIndexPath *)indexPath{
    self.titleLabel.text = dict[@"title"];
    if ([self.titleLabel.text isEqualToString:@"邮箱绑定"]) {
        self.completeIcon.hidden = NO;
        self.subTitleLabel.hidden = NO;
        self.subTitleLabel.text = [UserInfoTool userInfo].email;
        self.subTitleLabel.textColor = [UIColor blueColor];
    }else {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
}

@end
