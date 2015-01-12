//
//  BIDMainTableViewCell.m
//  Dessert_v1
//
//  Created by fengxi on 14-12-7.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//
#define key_poster_content_font 12.0
#define key_vote_up_url @"PosterVoteUp/"
#define key_vote_down_url @"PosterVoteDown/"
#define key_vote_cancel_url @"PosterVoteCancel/"
#import "BIDMainTableViewCell.h"
#import "UIImageView+comm.h"
#import "NSString+comm.h"
#import "BIDCommcode.h"
#import "BIDAccount.h"
#import "BIDAFNetWork.h"
@implementation BIDMainTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self TapImage];
    [self setButtonAction];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
  //  NSLog(@"%@",self.Username.text);
    // Configure the view for the selected state
}
-(instancetype)initItentifier:(NSString *)reuseIdentifier{
        BIDMainTableViewCell *cell=[[[NSBundle mainBundle]loadNibNamed:@"BIDMainTableViewCell" owner:nil options:nil]lastObject];
        [cell setRestorationIdentifier:reuseIdentifier];
    [cell.UserImage doCircleFrame];
        return cell;
}
-(void)TapImage{
    self.UserImage.userInteractionEnabled=YES;
    if (![self.UserImage gestureRecognizers]) {
        UITapGestureRecognizer *gesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(UserImageTough)];
        [self.UserImage addGestureRecognizer:gesture];
    }
}


- (void)UserImageTough {
    if (self.delegate!=nil &&[self.delegate respondsToSelector:@selector(UserImageClick)]) {
        [self.delegate UserImageClick];
    }
}
#pragma each cell height
-(CGFloat)cellHeight{
    CGFloat cellheight=80;
    CGFloat cellposterY=self.PosterContent.frame.origin.y;
    CGSize cellposterSize=[self GetLableSize:self.PosterContent];
    CGFloat height=cellposterSize.height;
    CGFloat resultheight=MAX(0, height+cellposterY-80+10);
    cellheight+=resultheight;
    return cellheight;
}
-(CGSize)GetLableSize:(UILabel *)label{
    CGSize resultSize=CGSizeZero;
    NSString *labelText=label.text;
    CGSize size=CGSizeMake(kScreen_Width-self.UserImage.frame.origin.x-self.UserImage.frame.size.width-50-32, 1000);
    resultSize=[labelText getCGSizeWithFont:label.font constrainedSize:size];
    return resultSize;
}

#pragma button up and down vote
-(void)setButtonAction{
    NSString *user_id=[NSString stringWithFormat:@"%d",[BIDAccount GetAccount].user_id.intValue];
    NSString *poster_id=[NSString stringWithFormat:@"%d",self.posterId.intValue];
    NSString *token=[BIDAccount GetAccount].token;
    NSString *baseUrl=@PoserUrl;
    NSString *paras=[NSString stringWithFormat:@"%@/%@/%@",user_id,poster_id,token];
    NSString *voteUpUrl=[NSString stringWithFormat:@"%@%@%@",baseUrl,key_vote_up_url,paras];
    NSString *voteDownUrl=[NSString stringWithFormat:@"%@%@%@",baseUrl,key_vote_down_url,paras];
    NSString *voteCancelUrl=[NSString stringWithFormat:@"%@%@%@",baseUrl,key_vote_cancel_url,paras];
    NSLog(@"%@",voteUpUrl);
    [self.upVote addBlcok:^(id obj) {
        if ([self checkPosterOwer]) {
            NSString *voteCancelUrl=[self getActionUrl:0];
            NSString *voteUpUrl=[self getActionUrl:1];
              NSLog(@"vote up ul %@",voteUpUrl);
            switch (self.voteFlag.intValue) {
                case 0://vote up +1
                     self.voteFlag=[[NSNumber alloc]initWithInt:1];                    
                    self.Scores=@(self.Scores.intValue+1);
                    [BIDAFNetWork GetDataFromNet:voteUpUrl success:^(NSDictionary *resultDic) {
                        NSLog(@"vote up success %@",resultDic);
                    } failure:^(NSError *error) {
                        
                    }];
                    break;
                case 1://vote cancel-1
                    self.voteFlag=[[NSNumber alloc]initWithInt:0];
                    self.Scores=@(self.Scores.intValue-1);
                    [BIDAFNetWork GetDataFromNet:voteCancelUrl success:^(NSDictionary *resultDic) {
                        NSLog(@"vote up cancel");
                    } failure:^(NSError *error) {
                        
                    }];
                    break;
                case 2://vote cancel vote up +1 +1
                    self.voteFlag=[[NSNumber alloc]initWithInt:1];
                    self.Scores=@(self.Scores.intValue+2);
                    [BIDAFNetWork GetDataFromNet:voteUpUrl success:^(NSDictionary *resultDic) {
                        NSLog(@"vote down to up");
                    } failure:^(NSError *error) {
                        
                    }];
                    break;
            }
            
        }
    }];
    [self.downVote addBlcok:^(id obj) {
        if ([self checkPosterOwer]) {
            NSString *voteCancelUrl=[self getActionUrl:0];
            NSString *voteDownUrl=[self getActionUrl:2];
            //NSLog(@"vote down %@",self.voteFlag);
            switch (self.voteFlag.intValue) {
                case 0://vote down -1
                    self.voteFlag=[[NSNumber alloc]initWithInt:2];
                    self.Scores=@(self.Scores.intValue-1);
                    [BIDAFNetWork GetDataFromNet:voteDownUrl success:^(NSDictionary *resultDic) {
                        NSLog(@"vote down");
                    } failure:^(NSError *error) {
                        
                    }];
                    break;
                case 1://vote cancel vote down -1 -1
                    self.voteFlag=[[NSNumber alloc]initWithInt:2];
                     self.Scores=@(self.Scores.intValue-2);
                    [BIDAFNetWork GetDataFromNet:voteDownUrl success:^(NSDictionary *resultDic) {
                        NSLog(@"vote up to down");
                    } failure:^(NSError *error) {
                        
                    }];
                    break;
                case 2://vote cancel+1
                    self.voteFlag=[[NSNumber alloc]initWithInt:0];
                      self.Scores=@(self.Scores.intValue+1);
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
    NSString *user_id=[NSString stringWithFormat:@"%d",[BIDAccount GetAccount].user_id.intValue];
    NSString *poster_id=[NSString stringWithFormat:@"%d",self.posterId.intValue];
    NSString *token=[BIDAccount GetAccount].token;
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
    if (self.ownerId==[BIDAccount GetAccount].user_id) {
        UIAlertView *alterview=[[UIAlertView alloc]initWithTitle:@"提示" message:@"Sorry,你不能给自己投票啦" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil];
        [alterview show];
        return NO;
    }
    return YES;
    
}
#pragma show the user vote result
-(void)setVoteFlag:(NSNumber *)voteFlag{
    _voteFlag=voteFlag;
    switch (voteFlag.intValue) {
        case 0://not vote
            [self.upVote setImage:[UIImage imageNamed:@"poster_arrow_ups@2x"] forState:UIControlStateNormal];
            [self.downVote setImage:[UIImage imageNamed:@"poster_arrow_downs@2x"] forState:UIControlStateNormal];
            break;
            
        case 1://vote up
            [self.upVote setImage:[UIImage imageNamed:@"poster_blue_arrow_ups@2x"] forState:UIControlStateNormal];
            [self.downVote setImage:[UIImage imageNamed:@"poster_arrow_downs@2x"] forState:UIControlStateNormal];
            break;
        case 2://vote down
            [self.upVote setImage:[UIImage imageNamed:@"poster_arrow_ups@2x"] forState:UIControlStateNormal];
            [self.downVote setImage:[UIImage imageNamed:@"poster_blue_arrow_downs@2x"] forState:UIControlStateNormal];
            break;
    }
}
-(void)setScores:(NSNumber *)Scores{
    _Scores=Scores;
   self.LabelScores.text=[NSString stringWithFormat:@"%d",_Scores.intValue-1];
}
@end
