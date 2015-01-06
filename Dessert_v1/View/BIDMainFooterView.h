//
//  BIDMainFooterView.h
//  Dessert_v1
//
//  Created by fengxi on 14-12-9.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^footerViewClick)(NSInteger);
@interface BIDMainFooterView : UIView
- (IBAction)LoadMore:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *LoadingImage;
@property (nonatomic,strong) footerViewClick ClickEvent;
@property (nonatomic)NSInteger PageEnd;
@end
