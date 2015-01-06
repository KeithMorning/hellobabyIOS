//
//  BIDPoster.h
//  FateApp
//
//  Created by fengxi on 14-11-20.
//  Copyright (c) 2014年 fengxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIDPoster : NSObject
@property (nonatomic,copy)NSString *Title;
@property (nonatomic,copy)NSString *PosterInput;
@property (nonatomic)NSString *User_ID;
@property (nonatomic)NSInteger VisitNum;
@property (nonatomic)NSInteger FavorNum;
@property(nonatomic)NSInteger LoveNum;
@property NSInteger OppsitionNum;
@property NSInteger ScoresNum;
/*
 {"newPoster": {
 "User_ID":"6",
 "Title": "我们在北京",
 "PosterInput": "你是我的小啊小苹果",
 "VisitNum": "100",
 "FavorNum": "20",
 "LoveNum": "200",
 "OppsitionNum": "30",
 "ScoresNum": "1000"
 }
 */

@end
