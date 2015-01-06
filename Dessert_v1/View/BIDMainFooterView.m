//
//  BIDMainFooterView.m
//  Dessert_v1
//
//  Created by fengxi on 14-12-9.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import "BIDMainFooterView.h"

@implementation BIDMainFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    BIDMainFooterView *view=nil;
   NSArray *viewarray=[[NSBundle mainBundle]loadNibNamed:@"BIDMainFooterView" owner:nil options:nil];
    view=[viewarray lastObject];    
    view.frame=CGRectMake(0, 0, frame.size.width, frame.size.height);
    return view;
}
-(void)awakeFromNib{
    [self ViewAddAction];
    [self.LoadingImage stopAnimating];

}
-(void)ViewAddAction{
    UITapGestureRecognizer *tapView=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(LoadMore:)];
    [self addGestureRecognizer:tapView];
}
- (IBAction)LoadMore:(id)sender{
   
    if (self.ClickEvent) {
        [self.LoadingImage startAnimating];
        self.ClickEvent(_PageEnd);
    }
}

@end
