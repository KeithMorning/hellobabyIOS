//
//  UIView+subline.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-29.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "UIView+subline.h"

@implementation UIView (subline)
-(void)addSubLine:(UIColor *)lineColor WithborderWidth:(CGFloat)borderWidth{
    CGSize size=self.bounds.size;
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0, size.height-borderWidth, size.width,borderWidth)];
    [line setBackgroundColor:lineColor];
    [self addSubview:line];
    
}
@end
