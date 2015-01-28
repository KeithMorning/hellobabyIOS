//
//  ViewController.h
//  GoodMessagecell
//
//  Created by fengxi on 15-1-22.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIPlaceholderTextView.h"
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIPlaceholderTextView *palcetxt;
- (IBAction)reply:(id)sender;


@end

