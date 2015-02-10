//
//  UIButtonVote.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-30.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "UIButtonVote.h"
#import "BIDAFNetWork.h"
@implementation UIButtonVote
-(instancetype)init:(UIButtonVoteType)type{
    self=[super init];
    if (self) {
        if (type==UIButtonVoteTypeUp) {
            [self ButtonVoteUpConfig];
         }else if(type==UIButtonVoteTypeDown){
             [self ButtonVoteDownConfig];
         }
    }
    return self;
}

-(void)ButtonVoteUpConfig{
    [self setImage:[UIImage imageNamed:@"poster_arrow_ups@2x"] forState:UIControlStateNormal];
    __weak typeof(self) weakSelf = self;
    [self addBlcok:^(id obj) {
        if ([weakSelf checkPosterOwer]) {
            NSString *voteCancelUrl=[weakSelf getActionUrl:0];
            NSString *voteUpUrl=[weakSelf getActionUrl:1];
            NSLog(@"vote up ul %@",voteUpUrl);
            switch (weakSelf.posterFlag) {
                case 0://vote up +1
                    //  self.voteFlag=[[NSNumber alloc]initWithInt:1];
                    weakSelf.posterFlag=BIDPosterFlagVoteUp;
                    weakSelf.Scores=@(weakSelf.Scores.intValue+1);
                    [BIDAFNetWork GetDataFromNet:voteUpUrl success:^(NSDictionary *resultDic) {
                        NSLog(@"vote up success %@",resultDic);
                    } failure:^(NSError *error) {
                        
                    }];
                    break;
                case 1://vote cancel-1
                    // self.voteFlag=[[NSNumber alloc]initWithInt:0];
                    weakSelf.posterFlag=BIDPosterFlagVoteCancel;
                    weakSelf.Scores=@(weakSelf.Scores.intValue-1);
                    [BIDAFNetWork GetDataFromNet:voteCancelUrl success:^(NSDictionary *resultDic) {
                        NSLog(@"vote up cancel");
                    } failure:^(NSError *error) {
                        
                    }];
                    break;
                case 2://vote cancel vote up +1 +1
                    weakSelf.posterFlag=BIDPosterFlagVoteUp;
                    weakSelf.Scores=@(weakSelf.Scores.intValue+2);
                    [BIDAFNetWork GetDataFromNet:voteUpUrl success:^(NSDictionary *resultDic) {
                        NSLog(@"vote down to up");
                    } failure:^(NSError *error) {
                        
                    }];
                    break;
            }
            
        }
        
    }];

}
-(void)ButtonVoteDownConfig{
    [self setImage:[UIImage imageNamed:@"poster_arrow_downs@2x"] forState:UIControlStateNormal];
    __weak typeof(self) weakSelf = self;
    [self addBlcok:^(id obj) {
        if ([weakSelf checkPosterOwer]) {
            NSString *voteCancelUrl=[weakSelf getActionUrl:0];
            NSString *voteDownUrl=[weakSelf getActionUrl:2];
            //NSLog(@"vote down %@",self.voteFlag);
            switch (weakSelf.posterFlag) {
                case 0://vote down -1
                    weakSelf.posterFlag=BIDPosterFlagVoteDown;
                    weakSelf.Scores=@(weakSelf.Scores.intValue-1);
                    [BIDAFNetWork GetDataFromNet:voteDownUrl success:^(NSDictionary *resultDic) {
                        NSLog(@"vote down");
                    } failure:^(NSError *error) {
                        
                    }];
                    break;
                case 1://vote cancel vote down -1 -1
                    weakSelf.posterFlag=BIDPosterFlagVoteDown;
                    weakSelf.Scores=@(weakSelf.Scores.intValue-2);
                    [BIDAFNetWork GetDataFromNet:voteDownUrl success:^(NSDictionary *resultDic) {
                        NSLog(@"vote up to down");
                    } failure:^(NSError *error) {
                        
                    }];
                    break;
                case 2://vote cancel+1
                    weakSelf.posterFlag=BIDPosterFlagVoteCancel;
                    weakSelf.Scores=@(weakSelf.Scores.intValue+1);
                    [BIDAFNetWork GetDataFromNet:voteCancelUrl success:^(NSDictionary *resultDic) {
                        NSLog(@"vote down cancel");
                    } failure:^(NSError *error) {
                        
                    }];
                    break;
            }
        }
        
        
    }];

}
-(NSString *)getActionUrl:(int)ActionNumber{//0 is cancel,1 is up ,2 is down
    NSString *user_id=[NSString stringWithFormat:@"%d",self.userID.intValue];
    NSString *poster_id=[NSString stringWithFormat:@"%d",self.posterID.intValue];
    NSString *token=self.token;
    NSString *baseUrl=@PoserUrl;
    NSString *paras=[NSString stringWithFormat:@"%@/%@/%@",user_id,poster_id,token];
    NSString *url;
    switch (ActionNumber) {
        case 0:
            url=[NSString stringWithFormat:@"%@%@%@",baseUrl,key_vote_cancel_url,paras];
            break;
        case 1:
            url=[NSString stringWithFormat:@"%@%@%@",baseUrl,key_vote_up_url,paras];
            break;
        case 2:
            url=[NSString stringWithFormat:@"%@%@%@",baseUrl,key_vote_down_url,paras];
            break;
    }
    
    return url;
    
}
#pragma check if it is self vote for self
-(BOOL)checkPosterOwer{
    if (_posterOwnerId==_userID) {
        UIAlertView *alterview=[[UIAlertView alloc]initWithTitle:@"提示" message:@"Sorry,你不能给自己投票啦" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil];
        [alterview show];
        return NO;
    }
    return YES;
    
}
#pragma show the user vote result
-(void)setPosterFlag:(BIDPosterFlag)posterFlag{
    _posterFlag=posterFlag;
    switch (_posterFlag) {
        case 0://not vote
            if (_ButtonType==UIButtonVoteTypeUp) {
                 [self setImage:[UIImage imageNamed:@"poster_arrow_ups@2x"] forState:UIControlStateNormal];
            }else if(_ButtonType==UIButtonVoteTypeDown){
                 [self  setImage:[UIImage imageNamed:@"poster_arrow_downs@2x"] forState:UIControlStateNormal];
            }
            break;
            
        case 1://vote up
            if (_ButtonType==UIButtonVoteTypeUp) {
                [self setImage:[UIImage imageNamed:@"poster_blue_arrow_ups@2x"] forState:UIControlStateNormal];
            }else if(_ButtonType==UIButtonVoteTypeDown){
                [self  setImage:[UIImage imageNamed:@"poster_arrow_downs@2x"] forState:UIControlStateNormal];
            }
            break;
        case 2://vote down
            if (_ButtonType==UIButtonVoteTypeUp) {
                [self setImage:[UIImage imageNamed:@"poster_arrow_ups@2x"] forState:UIControlStateNormal];
            }else if(_ButtonType==UIButtonVoteTypeDown){
                [self setImage:[UIImage imageNamed:@"poster_blue_arrow_downs@2x"] forState:UIControlStateNormal];
            }

            break;
    }
}
@end
