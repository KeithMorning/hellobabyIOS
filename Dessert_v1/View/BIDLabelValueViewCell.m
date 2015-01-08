//
//  BIDLabelValueViewCell.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-6.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "BIDLabelValueViewCell.h"
#import "BIDCommcode.h"
#import "UIColor+CreateMethods.h"
@interface BIDLabelValueViewCell()
@property (strong,nonatomic)UILabel *labelTitle;
@property (strong,nonatomic)UILabel *labelValue;
@end


@implementation BIDLabelValueViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
    self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    if (!_labelTitle) {
        _labelTitle=[[UILabel alloc]initWithFrame:CGRectMake(kPaddingLeftWidth, 7, 100, 30)];
        _labelTitle.backgroundColor=[UIColor clearColor];
        _labelTitle.font=[UIFont systemFontOfSize:16];
        _labelTitle.textColor=[UIColor blackColor];
        [self.contentView addSubview:_labelTitle];
        
    }
    if(!_labelValue){
        _labelValue=[[UILabel alloc]initWithFrame:CGRectMake(120, 7, kScreen_Width-(kPaddingLeftWidth+110)-30, 30)];
        _labelValue.backgroundColor=[UIColor clearColor];
        _labelValue.font=[UIFont systemFontOfSize:15];
        _labelValue.textColor=[UIColor colorWithHex:@"#999999" alpha:1.0f];
        _labelValue.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_labelValue];
    }
    }
    return self;
}

-(void)setCellTile:(NSString *)title setCellValue:(NSString *)value{
    _labelTitle.text=title;
    _labelValue.text=value;
}
+(CGFloat)rowHeight{
    return 44.0;
}
@end
