//
//  BIDAccount.h
//  Dessert_v1
//
//  Created by fengxi on 14-12-8.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import "BIDUser.h"

@interface BIDAccount : BIDUser<NSCoding>
@property(nonatomic,strong) NSString *token;
+(instancetype)GetAccount;
@end
