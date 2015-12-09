//
//  AttachmentInfoModel.h
//  TodayHomework
//
//  Created by wuqh on 15/12/9.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BaseModel.h"
//"id": "9f92bde5-ff6f-4aa1-b2ba-c7a609e72a0d",
//"createDate": 1449644785431,
//"createUser": null,
//"memo": null,
//"lastUpdateUser": null,
//"lastUpdateDate": 1449644785431,
//"version": 0,
//"attachmentName": "8EB4AD00-3540-43FF-ABA6-4909170ADD40.jpg",
//"attachmentType": "作业文档",
//"custId": "9d7e0e2d-4ea6-4d69-9dd8-74b92c8cc837",
//"docType": "jpg",
//"relatePrimary": "a6163ca9-2e10-4c0b-b8ef-324b3d102503",
//"relateTableIdentification": null,
//"storagePath": "/upload/20151209150625/8EB4AD00-3540-43FF-ABA6-4909170ADD40.jpg",
//"validStatus": "有效"

@interface AttachmentInfoModel : BaseModel

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *custId;
/**
 *  附件名称
 */
@property (nonatomic, copy) NSString *attachmentName;
/**
 *  附件类型（作业文档or答案文档）
 */
@property (nonatomic, copy) NSString *attachmentType;

@property (nonatomic, copy) NSString *docType;
/**
 *  附件路径
 */
@property (nonatomic, copy) NSString *storagePath;
@property (nonatomic, copy) NSString *validStatus;
@end
