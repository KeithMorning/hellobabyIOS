//
//  BIDCommeMeathod.m
//  FateApp
//
//  Created by fengxi on 14-12-1.
//  Copyright (c) 2014年 fengxi. All rights reserved.
//

#import "BIDCommeMeathod.h"

@implementation BIDCommeMeathod
static NSUserDefaults *UserDef;

-(id)init{
    if (self=[super init]) {
        UserDef=[NSUserDefaults standardUserDefaults];
    }
    return self;
}
+(NSString *)getuserName{
    UserDef=[NSUserDefaults standardUserDefaults];
    NSString *username= [UserDef objectForKey:@"username"];
    return username;
}
+(NSString *)getUserIDByLocal{
    UserDef=[NSUserDefaults standardUserDefaults];
    NSString *id= [UserDef objectForKey:@"UserID"];
    return id;
    
}
+ (NSDate *)DateFromDotNetJSONString:(NSString *)string {
    static NSRegularExpression *dateRegEx = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateRegEx = [[NSRegularExpression alloc] initWithPattern:@"^\\/date\\((-?\\d++)(?:([+-])(\\d{2})(\\d{2}))?\\)\\/$" options:NSRegularExpressionCaseInsensitive error:nil];
    });
    NSTextCheckingResult *regexResult = [dateRegEx firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
    
    if (regexResult) {
        // milliseconds
        NSTimeInterval seconds = [[string substringWithRange:[regexResult rangeAtIndex:1]] doubleValue] / 1000.0;
        /**
        // timezone offset
        if ([regexResult rangeAtIndex:2].location != NSNotFound) {
            NSString *sign = [string substringWithRange:[regexResult rangeAtIndex:2]];
            // hours
            seconds += [[NSString stringWithFormat:@"%@%@", sign, [string substringWithRange:[regexResult rangeAtIndex:3]]] doubleValue] * 60.0 * 60.0;
            // minutes
            seconds += [[NSString stringWithFormat:@"%@%@", sign, [string substringWithRange:[regexResult rangeAtIndex:4]]] doubleValue] * 60.0;
        }
        */
        return [NSDate dateWithTimeIntervalSince1970:seconds];
    }
    return nil;
}
+(NSString *)GetJsonDate:(NSString *)stringdate{
    NSDate *date=[self DateFromDotNetJSONString:stringdate];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    [dateformatter setTimeStyle:NSDateFormatterLongStyle];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateformatter stringFromDate:date];
}
+(NSDate *)GetLocalTimeNow:(NSDate *)date{
    NSTimeZone *timezone=[NSTimeZone systemTimeZone];
    NSInteger interval=[timezone secondsFromGMTForDate:date];
   // NSDate *dateww=[];
    NSDate *localdate=[date dateByAddingTimeInterval:interval];
    return localdate;
}
+(NSDate *)GetLocalTimeNowFromstr:(NSString *)dateString{
   // NSTimeZone *timezone=[NSTimeZone systemTimeZone];
    NSTimeZone *timezone=[NSTimeZone timeZoneWithName:@"Asia/Beijing"];
   NSDateFormatter *datef=[[NSDateFormatter alloc]init];
    [datef setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    [datef setTimeZone:timezone];
    NSDate *date=[datef dateFromString:dateString];
    return date;
}
+(NSString *)MakedatetoStr:(NSDate *)date{
    
    NSDateFormatter *datef=[[NSDateFormatter alloc]init];
     NSDateFormatter *datef2=[[NSDateFormatter alloc]init];
    [datef2 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    [datef setDateFormat:@"Z yyyy-MM-dd HH:mm:ss}"];
    [datef setTimeZone:[NSTimeZone timeZoneWithName: @"America/Adak"]];
    NSString *datestr=[datef stringFromDate:date];
    NSLog(@"locatime%@,GMT:%@,America:%@",[datef2 stringFromDate:date],date,datestr);
    return datestr;
}
+(NSString *)MakeJsonDate:(NSDate *)date{
    NSTimeInterval interval=[date timeIntervalSince1970]*1000;
    NSString *datestr=[[NSString alloc]initWithFormat:@"%0.0lf",interval];
    NSTimeZone *zone=[NSTimeZone systemTimeZone];
    NSInteger zoneinterval=[zone secondsFromGMT];
    NSInteger zonenum=zoneinterval/60/60*100;
    NSString *josn=[[NSString alloc]initWithFormat:@"/Date(%@+%04ld)/",datestr,zonenum];
    return josn;
}
@end
