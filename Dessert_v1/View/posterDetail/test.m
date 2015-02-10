//
//  test.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-31.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "test.h"

@implementation test
-(instancetype)initWithFrame:(CGRect)frame{
    test *e=nil;
    e=[[[NSBundle mainBundle]loadNibNamed:@"test" owner:nil options:nil]lastObject];
    e.frame=CGRectMake(0, 0, frame.size.width, frame.size.height);
   // e.good.text=@"dd";
    [e setBackgroundColor:[UIColor redColor]];
    return e;
}
-(void)awakeFromNib{
}
@end
