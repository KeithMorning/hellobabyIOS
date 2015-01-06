//
//  BIDLoginController.m
//  Dessert_v1
//
//  Created by fengxi on 14-12-6.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import "BIDLoginController.h"

@implementation BIDLoginController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setActivityViewOff];
    [self LoadUserPassword];
}
- (IBAction)LoginAction:(id)sender {
    [self setUrlParas];
   
   
}
-(void)setUrlParas{
  
    NSString *username=self.Text_UserName.text;
    NSString *password=self.Text_Password.text;
    if (![username isEqualToString:@""]&& ![password isEqualToString:@""] ) {
          paras=[[NSDictionary alloc]initWithObjectsAndKeys:username,@"name",password,@"password", nil];
         [self LoginTry];
    }else{
        NSLog(@"username or password shoulde input");
    }
    
}
-(void)LoginTry{
    [self setActivityViewOn];
  
    NSString *strUrl=[[NSString alloc]initWithFormat:@"%@%@",@ServerUrl,@"Login"];
    [BIDAFNetWork PostDataFromNet:strUrl InputParas:paras success:^(NSDictionary *resultDic) {
        [self setActivityViewOff];
        NSDictionary *result=[resultDic objectForKey:@"LoginResult"];
        NSString *loginStatus=[result objectForKey:@"LoginStatus"];
        NSLog(@"%@",result);
        if([loginStatus isEqual:KEY_LOGIN_NOT_PASS]){
            NSLog(@"Password or  Username is not right");
        }else if([loginStatus isEqual:KEY_LOGIN_ERROR]){
            NSLog(@"Login Failed");
        }else{
            BIDAccount *account=[BIDAccount GetAccount];
            account.username=[result objectForKey:@"UserName"];
            account.user_id=[result objectForKey:@"UserId"];
            account.Email=[result objectForKey:@"Email"];
            account.PhotoUrl=[result objectForKey:@"PhotoUrl"];
            account.Role=[result objectForKey:@"Role"];
            [self saveUserPassword];//保存密码用户名
            [self performSegueWithIdentifier:@"toMainPage" sender:self];
            
        }
    } failure:^(NSError *error) {
        [self setActivityViewOff];
        NSLog(@"failed to login :%@",error);

    }];

    
}
-(void)saveUserPassword{
    NSString *user=self.Text_UserName.text;
    NSString *password=self.Text_Password.text;
    [SSKeychain setPassword:password forService:@"login" account:user];
    NSUserDefaults *userDef=[NSUserDefaults standardUserDefaults];
    [userDef setObject:user forKey:@"username"];
    [userDef synchronize];
}
-(void)LoadUserPassword{
    NSUserDefaults *userDef=[NSUserDefaults standardUserDefaults];
    NSString *user=[userDef objectForKey:@"username"];
    if (user){
        self.Text_UserName.text=user;
        NSString *password=[SSKeychain passwordForService:@"login" account:user];
        self.Text_Password.text=password;
        
    }

}
-(void)setActivityViewOn{
    [self.ActivityView startAnimating];
}
-(void)setActivityViewOff{
    [self.ActivityView stopAnimating];
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.rowHeight=40;
}
@end
