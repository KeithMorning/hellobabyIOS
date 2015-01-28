//
//  UIView+AddLine.m
//  GoodMessagecell
//
//  Created by fengxi on 15-1-22.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "UIView+AddLine.h"

@implementation UIView (AddLine)
-(void)addSubline:(UIView *)view{
    CGFloat dwidth=CGRectGetWidth(self.bounds);
    CGFloat fheight=CGRectGetHeight(self.bounds);

    NSLog(@"%f",dwidth);
    if (view) {
        CGRect frame=CGRectMake(2, fheight-3, dwidth-4, 3.0);
        view.frame=frame;
    }
    [self addSubview:view];
}
@end
