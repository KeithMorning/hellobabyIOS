//
//  UIImageBlockView.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-10.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "UIImageBlockView.h"
@interface UIImageBlockView()
@property(nonatomic,copy) void(^tapBlcok)(id);
@end
@implementation UIImageBlockView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(instancetype)init{   
    return  [self initWithFrame:CGRectZero];
}

-(void)tap{
    if (self.tapBlcok) {
        self.tapBlcok(self);
    }
}
-(void)AddTapBlock:(void (^)(id))tapAction{
    if (tapAction) {
        self.tapBlcok=tapAction;
        if (![self gestureRecognizers]) {
            self.userInteractionEnabled=YES;
            UITapGestureRecognizer *tapgesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
            [self addGestureRecognizer:tapgesture];
        }
    }
}

@end
