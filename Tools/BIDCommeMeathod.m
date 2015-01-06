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
+(NSString *)getUserIDByLocal{
    UserDef=[NSUserDefaults standardUserDefaults];
    NSString *id= [UserDef objectForKey:@"UserID"];
    return id;
    
}

@end
