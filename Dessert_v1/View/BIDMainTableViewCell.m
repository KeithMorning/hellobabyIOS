//
//  BIDMainTableViewCell.m
//  Dessert_v1
//
//  Created by fengxi on 14-12-7.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//
#define key_poster_content_font 12.0
#import "BIDMainTableViewCell.h"
#import "UIImageView+comm.h"
#import "NSString+comm.h"
#import "BIDCommcode.h"
@implementation BIDMainTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self TapImage];
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
@end
