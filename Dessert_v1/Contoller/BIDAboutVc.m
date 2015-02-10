//
//  BIDAboutVc.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-3.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "BIDAboutVc.h"
#import "UIView+subline.h"
#import "NSDate+Helper.h"
#import "NSDate+comm.h"
#import "BIDPosterDetailHeader.h"
#import "test.h"
@interface BIDAboutVc ()
@property (nonatomic,strong)UITableView *myTableView;
@end

@implementation BIDAboutVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    BIDPoster *poster=[[BIDPoster alloc]init];
    poster.User_Name=@"gg";
    poster.PosterInput=@"124";
    poster.commentNum=2;
    poster.User_ID=@24;
    poster.UserPhoto=@"imagesUpLoad/UserPhoto/20150112012844_24.jpg";
    poster.ScoresNum=20;
    poster.PostTime=@"/Date(1420959013000+0800)/";
    
    BIDPosterDetailHeader *view=[[BIDPosterDetailHeader alloc]initWithFrame:CGRectMake(0  , 200, [UIScreen mainScreen].bounds.size.width, 300) withPoster:poster];
    [view setBackgroundColor:[UIColor redColor]];
    //test *view=[[test alloc]initWithFrame:CGRectMake(100, 100, 100, 300)];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)changeImage:(id)sender{
    NSDate *date=[NSDate date];
    NSDateFormatter *df=[[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr=@"2015-01-20 22:10:10";
    NSDate *dateold=[df dateFromString:dateStr];
   //NSLog(@"%ld %ld",[dateold daysAgoAgainstMidnight],[dateold daysAgo]);
    NSLog(@"%@",[dateold stringTimeAgo]);
    
    
}


@end
