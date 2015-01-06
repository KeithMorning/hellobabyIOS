//
//  BIDRegisterController.m
//  Dessert_v1
//
//  Created by fengxi on 14-12-6.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import "BIDRegisterController.h"
#import "BIDAFNetWork.h"
#import "BIDCommcode.h"
#import "SSKeychain.h"
@implementation BIDRegisterController

- (IBAction)RegisterAction:(id)sender {
    [self.registerActivity startAnimating];
    [self createUser];
}
-(void)createUser{
    NSString *username=self.Text_UserName.text;
    NSString *password=self.Text_Password.text;
    NSString *email   =self.Text_Email.text;
    if (![username isEqualToString:@""]&&![password isEqualToString:@""]&&![email isEqualToString:@""]) {
        para=[[NSDictionary alloc]initWithObjectsAndKeys:username,@"name",@"1",@"sex",password,@"Md5_password",@"user" ,@"role",self.Text_Email.text,@"email",@"15501025919",@"phoneNum",nil];
        NSString *urlstring=[[NSString alloc]initWithFormat:@"%@%@",@ServerUrl,@"CreateUser"];
        [BIDAFNetWork PostDataFromNet:urlstring InputParas:para success:^(NSDictionary *resultDic) {
            [self.registerActivity stopAnimating];
            NSString *result=[[NSString alloc]initWithFormat:@"%@",[resultDic objectForKey:@"NewUserResult"]];
            if ([result isEqualToString: KEY_REGISTER_SUCCESS]) {
                NSLog(@"Create a new user");
                [self saveUserPassword];
                [self.navigationController popViewControllerAnimated:YES];
            }else if([result isEqualToString:KEY_REGISTER_ERROR]){
                NSLog(@"Create user meet problem");
            }else{
                NSLog(@"this username has existed");
            }
        } failure:^(NSError *error) {
            [self.registerActivity stopAnimating];
            NSLog(@"%@",error);
        }];
    }else{
        NSLog(@"input a user name and password");
    }
}
-(void)saveUserPassword{
    NSString *user=self.Text_UserName.text;
    NSString *password=self.Text_Password.text;
    [SSKeychain setPassword:password forService:@"login" account:user];
    NSUserDefaults *userDef=[NSUserDefaults standardUserDefaults];
    [userDef setObject:user forKey:@"username"];
    [userDef synchronize];
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.rowHeight=40;
}
@end
