//
//  BIDViewController.m
//  FateApp
//
//  Created by fengxi on 14-10-27.
//  Copyright (c) 2014年 fengxi. All rights reserved.
//

#import "BIDViewController.h"
//#import "ASIHTTPRequest.h"
#import "BIDCommcode.h"
@interface BIDViewController ()
//-(void)CreateUser;
@end

@implementation BIDRegisterController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //self.activityView.hidden=YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)testASIhttp:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://192.168.211.1/ServiceForIOS.svc/json/100"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSData *response = [request responseData];
        NSDictionary *data=[NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        self.lable.text=[data objectForKey:@"JSONDataResult"];
    }

}

- (IBAction)TestforWcf:(id)sender {
    /*
    NSMutableDictionary *registerInfo=[[NSMutableDictionary alloc]init];
    [registerInfo setValue:@"Keith" forKey:@"name"];
    [registerInfo setValue:@"1" forKey:@"sex"];
    [registerInfo setValue:@"111966" forKey:@"Md5_password"];
    [registerInfo setValue:@"1" forKey:@"role"];
    [registerInfo setValue:@"xiooix@126.com" forKey:@"email"];
    [registerInfo setValue:@"15501025919" forKey:@"phoneNum"];
    NSError *error=nil;
    NSData *Jsondata=[NSJSONSerialization dataWithJSONObject:registerInfo options:NSJSONWritingPrettyPrinted error:&error];
    NSMutableData *multablejsondata=[NSMutableData dataWithData:Jsondata];
    NSMutableString *Str_serverUrl=[[NSMutableString alloc]initWithString:@ServerUrl];
    [Str_serverUrl appendString:@"/CreateUser"];
    NSURL *url=[NSURL URLWithString:Str_serverUrl];
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request setRequestMethod:@"POST"];
    [request setPostBody:multablejsondata];
    [request startSynchronous];
    NSError *requestError=[request error];
    if(!requestError){
        NSData *response = [request responseData];
        NSDictionary *data=[NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        self.WcfTestLable.text= [NSString stringWithFormat:@"%@",[data objectForKey:@"NewUserResult"]];
    }
     */
    [self Createuser];
}
-(void)Createuser{
    /*
     NSDictionary *user = [[NSDictionary alloc] initWithObjectsAndKeys:@"0", @"Version", nil];
     if ([NSJSONSerialization isValidJSONObject:user])
     {
     NSError *error;
     NSData *jsonData = [NSJSONSerialization dataWithJSONObject:user options:NSJSONWritingPrettyPrinted error: &error];
     NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
     //NSLog(@"Register JSON:%@",[[NSString alloc] initWithData:tempJsonData encoding:NSUTF8StringEncoding]);
     
     NSURL *url = [NSURL URLWithString:@"http://42.96.140.61/lev_version.php"];
     ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
     [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
     [request addRequestHeader:@"Accept" value:@"application/json"];
     [request setRequestMethod:@"POST"];
     [request setPostBody:tempJsonData];
     [request startSynchronous];
     NSError *error1 = [request error];
     if (!error1) {
     NSString *response = [request responseString];
     NSLog(@"Test：%@",response);
     }
     }
     */
    @try {
        
  
    NSMutableDictionary *registerInfo=[[NSMutableDictionary alloc]init];
    [registerInfo setValue:self.text_username.text forKey:@"name"];
    [registerInfo setValue:@"1" forKey:@"sex"];
    [registerInfo setValue:self.text_userPassword.text forKey:@"Md5_password"];
    [registerInfo setValue:@"user" forKey:@"role"];
    [registerInfo setValue:self.text_userEmail.text forKey:@"email"];
    [registerInfo setValue:@"15501025919" forKey:@"phoneNum"];
    NSError *error=nil;
    NSData *Jsondata=[NSJSONSerialization dataWithJSONObject:registerInfo options:NSJSONWritingPrettyPrinted error:&error];
    NSMutableData *multablejsondata=[NSMutableData dataWithData:Jsondata];
    NSMutableString *Str_serverUrl=[[NSMutableString alloc]initWithString:@ServerUrl];
    [Str_serverUrl appendString:@"CreateUser"];
    NSURL *url=[NSURL URLWithString:Str_serverUrl];
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request setRequestMethod:@"POST"];
    [request setPostBody:multablejsondata];
    [request setDelegate:self];
    [request startAsynchronous];
       
     
    /*
    NSError *requestError=[request error];
    if(!requestError){
        NSData *response = [request responseData];
        NSDictionary *data=[NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        self.WcfTestLable.text= [NSString stringWithFormat:@"%@",[data objectForKey:@"NewUserResult"]];
    }
     */
    }@catch(NSException *e){
        NSLog(@"create user meet exception: %@",e);
    }
   
 
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   // self.activityView.hidden=true;
    
}
-(void)requestFinished:(ASIHTTPRequest *)request{
    NSError *error=[request error];
    if(!error){
        NSData *response=[request responseData];
        NSDictionary *data=[NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        NSString *resultCreatUser=[NSString stringWithFormat:@"%@",[data objectForKey:@"NewUserResult"]];
        [self.activityView stopAnimating];
        if([resultCreatUser isEqualToString:@"1"]){
        NSLog(@"%@",@"Create user success!");
           /* self.loginview=[[BIDLoginViewController alloc]init];
            [self.loginview setModalTransitionStyle:UIModalTransitionStyleCoverVertical ];
            [self presentViewController:self.loginview animated:YES completion:^{NSLog(@"turn to login view");}];
            [self dismissModalViewControllerAnimated:YES];
        */
            [self performSegueWithIdentifier:@"reTologin" sender:self];
            }else if([resultCreatUser isEqualToString:@"0"])
        { NSLog(@"%@",@"create user meet some problem!");}
        else{
            NSLog(@"%@",@"this user has exit");
        }
    }
}
-(void)requestFailed:(ASIHTTPRequest *)request{
      NSError *error = [request error];
    NSLog(@"%@",error);
}

- (IBAction)btn_registerUser:(id)sender {
    
    [self Createuser];
    [self.activityView startAnimating];
}
@end
