//
//  BIDAboutVc.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-3.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "BIDAboutVc.h"
#import  "BIDAFNetWork.h"
#import "BIDAccount.h"
#import "NSObject+ObjectMap.h"
@interface BIDAboutVc ()

@end

@implementation BIDAboutVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
-(IBAction)changeImage:(id)sender{
    NSDictionary *dic=@{@"key":@"good",@"key2":[BIDAccount GetAccount]};
    NSLog(@"%@",dic);
}
@end
