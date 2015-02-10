//
//  BIDPosterDetailHeader.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-30.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "BIDPosterDetailHeader.h"
#import "BIDCommcode.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSDate+comm.h"
#import "UIButtonVote.h"
#import "UIImageView+comm.h"
@implementation BIDPosterDetailHeader

-(void)awakeFromNib{
    
}
-(instancetype)initWithFrame:(CGRect)frame withPoster:(BIDPoster *)poster{
    
    BIDPosterDetailHeader *headerview=nil;
    headerview=[[[NSBundle mainBundle]loadNibNamed:@"BIDPosterDetailHeader" owner:nil options:nil]lastObject];
    headerview.frame=frame;
    NSString *strPhotoUrl=poster.UserPhoto;
    //[self SetUserImage:strPhotoUrl withImage:headerview.userImageView];
    strPhotoUrl=[@Key_MainUrl stringByAppendingString:strPhotoUrl];
    NSLog(@"%@",strPhotoUrl);
    [headerview.userImage sd_setImageWithURL:[NSURL URLWithString:strPhotoUrl]];
    [headerview.userImage doCircleFrame];
    headerview.voteNumber.text= [NSString stringWithFormat:@"%ld",(long)poster.ScoresNum];
    headerview.voteFlag=poster.VoteFlag;
    headerview.userName.text=poster.User_Name;
    headerview.posterContent.text=poster.PosterInput;
    headerview.posterTime.text=[[NSDate stringMSJson:poster.PostTime] stringTimeAgo];
    [headerview setComentNumberByInteger:poster.commentNum withLable:headerview.comentNumber];
    //self.voteDownButton=[[UIButtonVote alloc]init:UIButtonVoteTypeDown];
    return headerview;
}
-(void)SetUserImage:(NSString *)strPhotoUrl withImage:(UIImageView *)userImage{
   
    if (![strPhotoUrl isEqualToString:@""]) {
        NSString *mainurl=@Key_MainUrl;
        strPhotoUrl=[mainurl stringByAppendingString:strPhotoUrl];
        NSURL *photoUrl=[NSURL URLWithString:strPhotoUrl];
        [userImage sd_setImageWithURL:photoUrl];
    }
}
-(void)setComentNumberByInteger:(NSInteger)num withLable:(UILabel *)lable{
    lable.text=[NSString stringWithFormat:@"评论(%ld)",num];
}
- (IBAction)VoteUp:(id)sender {
}

- (IBAction)voteDown:(id)sender {
}
@end
