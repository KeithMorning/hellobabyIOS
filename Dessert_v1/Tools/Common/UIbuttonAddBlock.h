//
//  UIbuttonAddBlock.h
//  Dessert_v1
//
//  Created by fengxi on 15-1-11.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIbuttonAddBlock : UIButton
-(void)addBlcok:(void(^)(id obj))action;
@property (nonatomic) BOOL selected;
@end
