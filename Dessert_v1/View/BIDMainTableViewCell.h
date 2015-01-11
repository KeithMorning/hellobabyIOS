//
//  BIDMainTableViewCell.h
//  Dessert_v1
//
//  Created by fengxi on 14-12-7.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIbuttonAddBlock.h"
@protocol mainCellDelegate<NSObject>
@optional
-(void)UserImageClick;
-(void)didSelected;
@end
@interface BIDMainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *UserImage;
@property (weak, nonatomic) IBOutlet UILabel *Username;
@property (weak, nonatomic) IBOutlet UILabel *PosterContent;
@property (weak, nonatomic) IBOutlet UILabel *Scores;
@property (nonatomic,strong) NSNumber *posterId;
@property (nonatomic,strong)NSNumber *ownerId;
@property (strong,nonatomic)id<mainCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIbuttonAddBlock *downVote;
@property (weak, nonatomic) IBOutlet UIbuttonAddBlock *upVote;


- (void)UserImageTough;
-(instancetype)initItentifier:(NSString *)reuseIdentifier;
-(CGFloat)cellHeight;
@end
