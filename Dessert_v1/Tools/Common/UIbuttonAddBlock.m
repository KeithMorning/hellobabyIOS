//
//  UIbuttonAddBlock.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-11.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "UIbuttonAddBlock.h"
@interface UIbuttonAddBlock()
@property(nonatomic,strong) void(^addBlock)(id obj);
@end
@implementation UIbuttonAddBlock
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(instancetype)init{
    CGRect rec=CGRectZero;
    return [self initWithFrame:rec];
}
-(void)tapUp{
    if (self.addBlock) {
        self.addBlock(self);
    }
}
-(void)addBlcok:(void(^)(id obj))action{
    self.addBlock=action;
    [self addTarget:self action:@selector(tapUp) forControlEvents:UIControlEventTouchUpInside];
}
@end
