//
//  BIDMainTableViewCell.m
//  Dessert_v1
//
//  Created by fengxi on 14-12-7.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import "BIDMainTableViewCell.h"

@implementation BIDMainTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
  //  NSLog(@"%@",self.Username.text);
    // Configure the view for the selected state
}
-(instancetype)initItentifier:(NSString *)reuseIdentifier{
        BIDMainTableViewCell *cell=[[[NSBundle mainBundle]loadNibNamed:@"BIDMainTableViewCell" owner:nil options:nil]lastObject];
        [cell setRestorationIdentifier:reuseIdentifier];
        return cell;
}
- (IBAction)UserImageTough:(id)sender {
    if (self.delegate!=nil &&[self.delegate respondsToSelector:@selector(UserImageClick)]) {
        [self.delegate UserImageClick];
    }
}
@end
