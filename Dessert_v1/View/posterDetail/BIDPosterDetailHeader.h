//
//  BIDPosterDetailHeader.h
//  Dessert_v1
//
//  Created by fengxi on 15-1-30.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDPoster.h"
#import "UIImageBlockView.h"
@interface BIDPosterDetailHeader : UIView
-(instancetype)initWithFrame:(CGRect)frame withPoster:(BIDPoster*)poster;
@property (weak, nonatomic) IBOutlet UIImageBlockView *userImage;

@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *posterContent;
@property (weak, nonatomic) IBOutlet UILabel *posterTime;
- (IBAction)VoteUp:(id)sender;
- (IBAction)voteDown:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *voteNumber;
@property (weak, nonatomic) IBOutlet UILabel *comentNumber;
@property (nonatomic) NSInteger voteFlag;
@property (weak, nonatomic) IBOutlet UIButton *voteUpButton;
@property (weak, nonatomic) IBOutlet UIButton *voteDownButton;


@end
