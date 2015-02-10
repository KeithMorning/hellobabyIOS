//
//  NSDate+comm.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-30.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "NSDate+comm.h"
#import "BIDCommeMeathod.h"
@implementation NSDate (comm)

-(NSString *)stringTimeAgo{
    if ([self compare:[NSDate date]]==NSOrderedDescending) {
        return @"刚刚";
    }
    NSString *text=nil;
    NSInteger agoCount=[self daysAgoAgainstMidnight];
    switch (agoCount) {
        case 0:
             text=[NSString stringWithFormat:@"今天%@",[self HHMMframter]];
            break;
         case 1:
            text=[NSString stringWithFormat:@"昨天%@",[self HHMMframter]];
            break;
         case 2:
            text=[NSString stringWithFormat:@"前天%@",[self HHMMframter]];
            break;
        default:
            text=[NSString stringWithFormat:@"%@",[self MMddHHMMframter]];
            break;
    }

    return text;
}
-(NSString *)HHMMframter{
    NSDateFormatter *df=[[NSDateFormatter alloc]init];
    [df setDateFormat:@"HH:mm"];
    return [df stringFromDate:self];
}
-(NSString *)MMddHHMMframter{
    NSDateFormatter *df=[[NSDateFormatter alloc]init];
    [df setDateFormat:@"MM-dd HH:mm"];
    return [df stringFromDate:self];
}
+(NSDate *)stringMSJson:(NSString *)MSJsonTime{
    return [BIDCommeMeathod DateFromDotNetJSONString:MSJsonTime];
}
@end
