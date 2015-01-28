//
//  GoodMessagebox.h
//  GoodMessagecell
//
//  Created by fengxi on 15-1-23.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIPlaceholderTextView.h"

@interface GoodMessagebox : UIView<UIPlaceholderTextViewDelegate,UITextViewDelegate>
@property (nonatomic,strong)UIPlaceholderTextView *Inputview;
@property (nonatomic,strong)UIButton *sendButton;
-(void)sendMessage:(void(^)(NSString *))inputText;
@end
