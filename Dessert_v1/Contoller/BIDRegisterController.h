//
//  BIDRegisterController.h
//  Dessert_v1
//
//  Created by fengxi on 14-12-6.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import  "BIDCommcode.h"
@interface BIDRegisterController : UITableViewController{
    NSDictionary *para;
}
@property (weak, nonatomic) IBOutlet UITextField *Text_UserName;
@property (weak, nonatomic) IBOutlet UITextField *Text_Password;
- (IBAction)RegisterAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *Text_Email;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *registerActivity;
@end
