//
//  BIDWelcomeViewController.h
//  FateApp
//
//  Created by fengxi on 14-11-2.
//  Copyright (c) 2014年 fengxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDJsonConn.h"
#import "BIDUser.h"
#import "BIDCommcode.h"

@interface BIDWelcomeViewController : UIViewController<JsonConnDeleage>
{
    BIDJsonConn *conn;
    NSString *r_user_id;
}
@property (nonatomic,strong)BIDUser *thisuser;
@property (weak, nonatomic) IBOutlet UILabel *Lab_thisuser;
+(NSString *)getUsername;
@end
