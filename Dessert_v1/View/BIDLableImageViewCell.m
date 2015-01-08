//
//  BIDLableImageViewCell.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-6.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//
#define kLableImageViewCellHeight 50.0
#import "BIDLableImageViewCell.h"
#import "BIDCommcode.h"
#import "UIImageView+comm.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface BIDLableImageViewCell()
@property(strong,nonatomic)UIImageView *userImage;
@property(strong,nonatomic)UILabel *labelTitle;
@end
@implementation BIDLableImageViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        if (!_labelTitle) {
            _labelTitle=[[UILabel alloc]initWithFrame:CGRectMake(kPaddingLeftWidth, ([BIDLableImageViewCell cellHeight]-30)/2, 100, 30)];
            _labelTitle.backgroundColor=[UIColor clearColor];
            _labelTitle.font=[UIFont systemFontOfSize:16];
            _labelTitle.textColor=[UIColor blackColor];
            [self.contentView addSubview:_labelTitle];
        }
        if (!_userImage) {
            _userImage=[[UIImageView alloc]initWithFrame:CGRectMake(kScreen_Width-(kLableImageViewCellHeight+10+30),([BIDLableImageViewCell cellHeight]- kLableImageViewCellHeight)/2, kLableImageViewCellHeight, kLableImageViewCellHeight)];
            [_userImage doCircleFrame];
            [self.contentView addSubview:_userImage];
            
        }
    }
    
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    BIDAccount *account=[BIDAccount GetAccount];
    if (account) {
          NSString *str_photourl=account.PhotoUrl;
        NSString *mainurl=@Key_MainUrl;
        str_photourl=[mainurl stringByAppendingString:str_photourl];
        NSURL *photoUrl=[NSURL URLWithString:str_photourl];
       // DebugLog(str_photourl);
        self.labelTitle.text=account.username;
        [self.userImage sd_setImageWithURL:photoUrl placeholderImage:[UIImage imageNamed:@"placeholderRound25@2x"]];
    }
  
    
}
+(CGFloat)cellHeight{
    return 70.0;
}

@end
