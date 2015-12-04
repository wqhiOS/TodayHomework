//
//  HeaderIconCell.m
//  TodayHomework
//
//  Created by wuqh on 15/12/3.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "HeaderIconCell.h"
#import <UIImageView+WebCache.h>
#import "THAPI.h"

@interface HeaderIconCell()


@property (weak, nonatomic) IBOutlet UIImageView *headerIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *custNameLabel;


@end

@implementation HeaderIconCell

+ (instancetype)headerIconCell {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    // Initialization code
    self.headerIconImageView.layer.masksToBounds = YES;
    self.headerIconImageView.layer.cornerRadius = 30;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateUIWithDictionary:(NSDictionary *)dict withIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%@",[API_Picture stringByAppendingString:dict[@"iconHeader"]]);
    [self.headerIconImageView sd_setImageWithURL:[NSURL URLWithString:[API_Picture stringByAppendingString:dict[@"iconHeader"]]]];
    self.custNameLabel.text = dict[@"name"];
}

@end
