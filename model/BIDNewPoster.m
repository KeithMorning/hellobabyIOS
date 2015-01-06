//
//  BIDNewPoster.m
//  FateApp
//
//  Created by fengxi on 14-11-20.
//  Copyright (c) 2014年 fengxi. All rights reserved.
//

#import "BIDNewPoster.h"
#import "BIDAComplexMode.h"
@interface BIDNewPoster()
-(void)SavePoster:(NSString *)posterinput;
@end
@implementation BIDNewPoster
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initPosterTextview];
}
- (IBAction)PosterCommit:(id)sender {
    if (![self.posterTextView.text isEqualToString:@""]) {
        [self SavePoster:self.posterTextView.text];
    }
    
    
}
-(void)SavePoster:(NSString *)posterinput{
    poster=[[BIDPoster alloc]init];
    poster.User_ID=[BIDCommeMeathod getUserIDByLocal];
    poster.PosterInput=posterinput;
    NSDictionary *PoserDic=[BIDObjectToNsDictionary getObjectData:poster];
   conn=[[BIDJsonConn alloc]init:@PoserUrl];
    conn.delegateforConn=self;
    NSMutableDictionary *PosterBody=[[NSMutableDictionary alloc]initWithDictionary:PoserDic];
    NSMutableDictionary *newPoster=[[NSMutableDictionary alloc]initWithObjectsAndKeys:PosterBody,@"newPoster", nil];
    [conn PostdataByJsonAsy:newPoster ExtensionUrl:@"SavePoster"];
    
}
-(void)initPosterTextview{
    self.posterTextView.layer.cornerRadius=6.0;
    self.posterTextView.layer.masksToBounds=YES;
    self.posterTextView.autocapitalizationType=UITextAutocapitalizationTypeNone;
}
#pragma jsonconn 
#pragma delegate
-(void)jsonRequestFinished:(NSDictionary *)requestdata{
#ifdef DEBUG
    NSLog(@"%@",@"a new poster");
#endif
    
}
-(void)josnRequestError{
    NSLog(@"network problem");
}
-(void)printUser{
    BIDUser *auser=[[BIDUser alloc]init];
    auser.user_id=@"11";
    auser.username=@"keith";
    BIDAComplexMode *ac=[[BIDAComplexMode alloc]init];
    ac.user=auser;
    ac.name=@"rita";
    [BIDObjectToNsDictionary print:ac];
}
@end
