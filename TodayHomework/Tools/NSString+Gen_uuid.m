//
//  NSString+Gen_uuid.m
//  TodayHomework
//
//  Created by wuqh on 15/12/8.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "NSString+Gen_uuid.h"

@implementation NSString (Gen_uuid)
+(NSString *) gen_uuid
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    
    CFRelease(uuid_string_ref);
    return uuid;
}
@end
