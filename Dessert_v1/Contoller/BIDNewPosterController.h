//
//  BIDNewPosterController.h
//  Dessert_v1
//
//  Created by fengxi on 14-12-9.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//
#define savePosterUrl "SavePoster"
#import <UIKit/UIKit.h>
#import "BIDAFNetWork.h"
#import "BIDPoster.h"
#import "BIDAccount.h"
#import "BIDObjectToNsDictionary.h"
#import "BIDCommcode.h"
#import "BIDPosterCellModel.h"
#import "ProgressHUD.h"
@interface BIDNewPosterController : UIViewController
- (IBAction)Posterpost:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *PosterText;

@end
