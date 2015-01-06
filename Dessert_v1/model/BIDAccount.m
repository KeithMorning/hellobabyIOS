//
//  BIDAccount.m
//  Dessert_v1
//
//  Created by fengxi on 14-12-8.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import "BIDAccount.h"
static BIDAccount *_account;
@implementation BIDAccount

+(id)allocWithZone:(struct _NSZone *)zone{
   static dispatch_once_t takeone;
    dispatch_once(&takeone, ^{
        _account=[super allocWithZone:zone];
    });
    return _account;
}
+(instancetype)GetAccount{
    static dispatch_once_t takeone;
    dispatch_once(&takeone, ^{
        _account=[[self alloc]init];
    });
    return _account;
}
+(id)copyWithZone:(struct _NSZone *)zone{
    return _account;
}
-(id)copy{
    return _account;
}
@end
