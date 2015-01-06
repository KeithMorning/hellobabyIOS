//
//  BIDViewJump.h
//  Dessert_v1
//
//  Created by fengxi on 14-12-9.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BIDViewJump : NSObject
{
    UIView *viewBegin;
    UIView *viewEnd;
}
+(void)ViewJump:(NSString*)segueIntentifer ParaentController:(UIViewController *)controller;
@end
