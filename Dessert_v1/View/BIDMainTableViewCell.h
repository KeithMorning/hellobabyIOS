//
//  BIDMainTableViewCell.h
//  Dessert_v1
//
//  Created by fengxi on 14-12-7.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol mainCellDelegate<NSObject>
@optional
-(void)UserImageClick;
-(void)didSelected;
@end
@interface BIDMainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *UserImage;
@property (weak, nonatomic) IBOutlet UILabel *Username;
@property (weak, nonatomic) IBOutlet UILabel *PosterContent;
@property (strong,nonatomic)id<mainCellDelegate> delegate;
- (IBAction)UserImageTough:(id)sender;
-(instancetype)initItentifier:(NSString *)reuseIdentifier;
-(void)setHeight;
@end
