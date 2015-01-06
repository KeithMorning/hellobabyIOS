//
//  BIDViewController.h
//  FateApp
//
//  Created by fengxi on 14-10-27.
//  Copyright (c) 2014年 fengxi. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BIDRegisterController:UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *lable;
@property (weak, nonatomic) IBOutlet UIButton *TestWcf;
- (IBAction)TestforWcf:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *WcfTestLable;
-(void)Createuser;
@property (weak, nonatomic) IBOutlet UITextField *text_username;
@property (weak, nonatomic) IBOutlet UITextField *text_userPassword;
@property (weak, nonatomic) IBOutlet UITextField *text_userEmail;
- (IBAction)btn_registerUser:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;


@end
