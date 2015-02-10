//
//  UIButtonVote.h
//  Dessert_v1
//
//  Created by fengxi on 15-1-30.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//
#define key_vote_up_url @"PosterVoteUp/"
#define key_vote_down_url @"PosterVoteDown/"
#define key_vote_cancel_url @"PosterVoteCancel/"
#import "UIbuttonAddBlock.h"
#import "BIDCommcode.h"
typedef NS_ENUM(NSInteger, UIButtonVoteType) {
    UIButtonVoteTypeUp=1,
    UIButtonVoteTypeDown
};
typedef NS_ENUM(NSInteger, BIDPosterFlag) {
    BIDPosterFlagVoteCancel=0,
    BIDPosterFlagVoteUp=1,
    BIDPosterFlagVoteDown=2
};
@interface UIButtonVote : UIbuttonAddBlock
@property (nonatomic,assign)UIButtonVoteType ButtonType;
@property (nonatomic,assign) BIDPosterFlag posterFlag;
@property (nonatomic,assign)NSNumber* posterID;
@property (nonatomic,assign)NSNumber *posterOwnerId;
@property (nonatomic,assign)NSNumber* userID;
@property(nonatomic,strong)NSString *token;
@property (nonatomic,assign)NSNumber *Scores;
-(instancetype)init:(UIButtonVoteType)type;
@end
