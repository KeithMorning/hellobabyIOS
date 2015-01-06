//
//  BIDMainController.h
//  Dessert_v1
//
//  Created by fengxi on 14-12-6.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//
#define Url_GetUserID @"GetUserID/"
#define loadOnceCount 10
#import <UIKit/UIKit.h>
#import "BIDMainTableViewCell.h"
#import "BIDAccount.h"
#import "BIDPosterCellModel.h"
@class BIDUser;
//extern BIDUser *thisUser;
@interface BIDMainController : UITableViewController<UITableViewDelegate,UITableViewDataSource,mainCellDelegate>
{
    NSInteger pagecount;
    BIDAccount *account;
    NSArray *posters;
}
//@property(nonatomic,strong)BIDUser *thisUser;
@property (strong, nonatomic) IBOutlet UITableView *MainTableView;
- (IBAction)LogOff:(id)sender;
@end
