//
//  BIDWelcomeViewController.m
//  FateApp
//
//  Created by fengxi on 14-11-2.
//  Copyright (c) 2014年 fengxi. All rights reserved.
//

#import "BIDWelcomeViewController.h"

@interface BIDWelcomeViewController ()
-(void)setWelcomeName;
-(void)GetUserID;
-(void)SaveUserID:(NSString *)UserID;
@end

@implementation BIDWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     conn=[[BIDJsonConn alloc]init:@ServerUrl];
    [self setWelcomeName];
    [self GetUserID];
    // Do any additional setup after loading the view.
}
-(void)applicationFinishedRestoringState{
    
}
-(void)setWelcomeName{
    self.thisuser=[[BIDUser alloc]init];
    self.thisuser.username=[BIDWelcomeViewController getUsername];
    self.Lab_thisuser.text=[[NSString alloc]initWithFormat:@"%@",_thisuser.username];
    
}
+(NSString *)getUsername{
    NSUserDefaults *Dfs=[NSUserDefaults standardUserDefaults];
    NSString *username=[Dfs objectForKey:@"username"];
    return username;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)GetUserID{
   
    conn.delegateforConn=self;
    NSString *inUrl=[[NSString alloc]initWithFormat: @"GetUserID/%@",_thisuser.username];
    [conn GetdataByJsonAsy:inUrl];
}
-(void)josnRequestError{
    
}
-(void)jsonRequestFinished:(NSDictionary *)requestdata{
   r_user_id=[requestdata objectForKey:@"GetUserIDResult"];
    self.thisuser.user_id=r_user_id;
    self.Lab_thisuser.text=[[NSString alloc]initWithFormat:@"%@(%@)",_thisuser.username,_thisuser.user_id]
    ;
#ifdef DEBUG
    NSLog(@"User id  is %@",r_user_id);
#endif
    NSString *userid=[[NSString alloc]initWithFormat:@"%@",r_user_id];
    [self SaveUserID:userid];
}
-(void)SaveUserID:(NSString *)UserID{
    if (![UserID isEqualToString:@""]&&(UserID!=nil)) {
        NSUserDefaults *Dfs=[NSUserDefaults standardUserDefaults];
        [Dfs setObject:UserID forKey:@"UserID"];
        [Dfs synchronize];
    }

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
