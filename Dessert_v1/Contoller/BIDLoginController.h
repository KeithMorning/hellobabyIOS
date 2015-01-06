//
//  BIDLoginController.h
//  Dessert_v1
//
//  Created by fengxi on 14-12-6.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  "BIDCommcode.h"
#import "BIDJsonToDictionary.h"
#import "BIDAFNetWork.h"
#import "SSKeychain.h"
#import  "BIDAccount.h"
@interface BIDLoginController : UITableViewController{
        NSDictionary *paras;
}
@property (weak, nonatomic) IBOutlet UITextField *Text_UserName;
@property (weak, nonatomic) IBOutlet UITextField *Text_Password;
- (IBAction)LoginAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ActivityView;

@end
