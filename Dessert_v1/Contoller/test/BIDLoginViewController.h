//
//  BIDLoginViewController.h
//  FateApp
//
//  Created by fengxi on 14-11-1.
//  Copyright (c) 2014年 fengxi. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "BIDJsonConn.h"
#import "BIDCommcode.h"
#import "SSKeychain.h"

@interface BIDLoginViewController : UITableViewController<JsonConnDeleage>{
    BIDJsonConn *bidjson;
}
@property (weak, nonatomic) IBOutlet UITextField *Username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)btnLogin:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *LoginActivy;

@end
