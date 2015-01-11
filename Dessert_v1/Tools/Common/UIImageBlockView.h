//
//  UIImageBlockView.h
//  Dessert_v1
//
//  Created by fengxi on 15-1-10.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageBlockView : UIImageView
-(void)AddTapBlock:(void(^)(id obj))tapAction;
@end
