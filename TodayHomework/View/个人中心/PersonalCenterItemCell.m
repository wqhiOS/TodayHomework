//
//  PersonalCenterItemCell.m
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "PersonalCenterItemCell.h"

@interface PersonalCenterItemCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation PersonalCenterItemCell

+ (instancetype)personalCenterItemCell {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    // Initialization code
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateUIWithDictionary:(NSDictionary *)dict withIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 3) {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    self.imageView.image = [UIImage imageNamed:dict[@"icon"]];
    self.titleLabel.text = dict[@"title"];
}

@end
