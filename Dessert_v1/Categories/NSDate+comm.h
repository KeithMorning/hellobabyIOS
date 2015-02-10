//
//  NSDate+comm.h
//  Dessert_v1
//
//  Created by fengxi on 15-1-30.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+Helper.h"
@interface NSDate (comm)
-(NSString *)stringTimeAgo;
+(NSDate *)stringMSJson:(NSString*)MSJsonTime;
@end
