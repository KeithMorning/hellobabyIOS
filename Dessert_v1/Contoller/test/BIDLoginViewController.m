//
//  BIDLoginViewController.m
//  FateApp
//
//  Created by fengxi on 14-11-1.
//  Copyright (c) 2014年 fengxi. All rights reserved.
//

#import "BIDLoginViewController.h"

@interface BIDLoginViewController ()
-(void)SaveUserAndPassword;
-(void)loadUserAndPassword;
@end

@implementation BIDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        bidjson=[[BIDJsonConn alloc] init:@ServerUrl];
    bidjson.delegateforConn=self;
    [self loadUserAndPassword];
  
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnLogin:(id)sender {   
    NSMutableDictionary *loginfo=[[NSMutableDictionary alloc]init];
    loginfo=[NSMutableDictionary dictionaryWithObjectsAndKeys:self.Username.text,@"name",self.password.text,@"password", nil];
    [bidjson PostdataByJsonAsy:loginfo ExtensionUrl:@"Login"];
    [self.LoginActivy startAnimating];

    
}

-(void)jsonRequestFinished:(NSDictionary *)requestdata{
    [self.LoginActivy stopAnimating];
    NSString *loginResult=[requestdata objectForKey:@"LoginResult"];
    if ([loginResult isEqual:KEY_LOGIN_PASS]) {
        NSLog(@"LOGIN SUCCESS!");
        [self SaveUserAndPassword];
        [self performSegueWithIdentifier:@"toWelcome" sender:self];

    }else if([loginResult isEqual:KEY_LOGIN_NOT_PASS]){
        NSLog(@"user or password is not right");
    }else{
        NSLog(@"network cann't reach");
    }
    
}
/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"toWelcome"]){
        BIDWelcomeViewController *welControler=segue.destinationViewController;
        welControler.thisuser.username=self.Username.text;
    }
}*/
-(void)SaveUserAndPassword{
    NSString *user=self.Username.text;
    NSString *password=self.password.text;
    [SSKeychain setPassword:password forService:@"login" account:user];
    NSUserDefaults *userDef=[NSUserDefaults standardUserDefaults];
    [userDef setObject:user forKey:@"username"];
    [userDef synchronize];
}
-(void)loadUserAndPassword{
     NSUserDefaults *userDef=[NSUserDefaults standardUserDefaults];
    NSString *user=[userDef objectForKey:@"username"];
    if (user){
        self.Username.text=user;
        NSString *password=[SSKeychain passwordForService:@"login" account:user];
        self.password.text=password;
       
    }
}
-(void)dealloc{
    //[bidjson dealloc];
}
@end
