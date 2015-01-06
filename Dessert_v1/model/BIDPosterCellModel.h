//
//  BIDPosterCellModel.h
//  Dessert_v1
//
//  Created by fengxi on 14-12-10.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//
#define  urlGetPoster "GetPoster"
#import <Foundation/Foundation.h>
#import "BIDCommeMeathod.h"
#import "BIDPoster.h"
#import "BIDAccount.h"
#import "BIDAFNetWork.h"
@interface BIDPosterCellModel : NSObject
@property (nonatomic,strong) NSDictionary *posterCells;
-(void)GetPostersFromNet:(int)pageStart pageEnd:(int)pageEnd;
@end
