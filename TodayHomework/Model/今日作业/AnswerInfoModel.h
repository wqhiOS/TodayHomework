//
//  AnswerInfoModel.h
//  TodayHomework
//
//  Created by wuqh on 15/12/7.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BaseModel.h"

@interface AnswerInfoModel : BaseModel

@property (nonatomic, copy) NSString *attachmentName;
@property (nonatomic, copy) NSString *attachmentType;
@property (nonatomic, copy) NSString *custId;
@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *docType;
@property (nonatomic, copy) NSString *storagePath;
@property (nonatomic, copy) NSString *validStatus;

@end
