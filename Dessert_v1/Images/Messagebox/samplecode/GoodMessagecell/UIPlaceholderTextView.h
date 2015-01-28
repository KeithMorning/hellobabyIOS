//
//  UIPlaceholderTextView.h
//  GoodMessagecell
//
//  Created by fengxi on 15-1-22.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol UIPlaceholderTextViewDelegate<NSObject>
@optional
-(void)TextViewDidChange:(CGSize)size;
@end

@interface UIPlaceholderTextView : UITextView<UITextViewDelegate>
@property (nonatomic,strong) NSString *placeText;
@property (nonatomic,strong) UIColor *placeColor;
@property (nonatomic,assign) id<UIPlaceholderTextViewDelegate> selfDelegate;
@property (nonatomic,assign) BOOL Textnil;//输入框是否为空
-(void)TextChange:(NSNotification *)notification;
-(instancetype)initWithFrame:(CGRect)frame PlaceText:(NSString *)placeText PlaceColor:(UIColor *)placeColor;
@end
