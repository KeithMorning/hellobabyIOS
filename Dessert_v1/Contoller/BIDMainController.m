//
//  BIDMainController.m
//  Dessert_v1
//
//  Created by fengxi on 14-12-6.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import "BIDMainController.h"
#import "BIDCommeMeathod.h"
#import  "BIDCommcode.h"
#import "BIDAFNetWork.h"
#import "BIDMainFooterView.h"
#import "BIDMainHeaderView.h"
#import "BIDMainTableViewCell.h"
#import "UIKit+AFNetworking.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation BIDMainController

- (IBAction)LogOff:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setTtileName];
    [self SetTableviewFooter];
    [self setViewRefreshControl];
    [self RegisterPosterNotifation];
    [self ModeldataRefreshOnce];
    
}
#pragma firstload meathod
-(void)mainpagefistLoad{

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self mainpagefistLoad];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.refreshControl.refreshing) {
        //TODO: 已经在刷新数据了
    } else {
        if (self.tableView.contentOffset.y == 0) {
            
            [UIView animateWithDuration:0.25
                                  delay:0
                                options:UIViewAnimationOptionBeginFromCurrentState
                             animations:^(void){
                                 self.tableView.contentOffset = CGPointMake(0, -self.refreshControl.frame.size.height);
                             } completion:^(BOOL finished){
                                 [self.refreshControl beginRefreshing];
                                 [self.refreshControl sendActionsForControlEvents:UIControlEventValueChanged];
                             }];
        }
    }
}

#pragma ModeldataRefresh
-(void)RegisterPosterNotifation{

    NSNotificationCenter *center=[NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(NotificationModeldataRefresh:) name:@"PosterCellDataReady" object:nil];

}
-(void)NotificationModeldataRefresh:(NSNotification *)notification{

   // NSLog(@"we reload data %@",[notification.userInfo objectForKey:getPosterResult]);
    posters=[notification.userInfo objectForKey:getPosterResult];
    [self.tableView reloadData];
    self.tableView.tableFooterView.hidden=NO;
    [self footerLoadImageStop];
}
-(void)ModeldataRefreshOnce{
    BIDPosterCellModel *cellmodel=[[BIDPosterCellModel alloc]init];
    pagecount+=loadOnceCount;
    [cellmodel GetPostersFromNet:0 pageEnd:pagecount];
}
-(void)ModeldataRefresh{
    BIDPosterCellModel *cellmodel=[[BIDPosterCellModel alloc]init];
    [cellmodel GetPostersFromNet:0 pageEnd:loadOnceCount];
}
#pragma set the refresh bar
-(void)setViewRefreshControl{
    UIRefreshControl *refeshControl=[[UIRefreshControl alloc]init];
    refeshControl.attributedTitle=[[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [refeshControl addTarget:self action:@selector(ViewReloadData) forControlEvents:UIControlEventValueChanged];
    self.refreshControl=refeshControl;
}
-(void)ViewReloadData{
    if (self.refreshControl.refreshing) {
        self.refreshControl.attributedTitle=[[NSAttributedString alloc]initWithString:@"正在加载"];
        NSDate *date=[[NSDate alloc]init];
        [self ModeldataRefresh];
        [self performSelector:@selector(getDataFromNet) withObject:date afterDelay:2];
    }
}
-(void)getDataFromNet{
    [self.refreshControl endRefreshing];
    self.refreshControl.attributedTitle=[[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [self.tableView reloadData];
}
#pragma set the table footer
-(void)SetTableviewFooter{
    BIDMainFooterView *footview=[[BIDMainFooterView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 44)];
    self.tableView.tableFooterView.contentMode=UIViewContentModeScaleAspectFill;
    self.tableView.tableFooterView=footview;
    footview.PageEnd=10;
    footview.ClickEvent=^(NSInteger a){[self LoadMoreData:a];};
}
-(void)LoadMoreData:(NSInteger)PageEnd{
    [self ModeldataRefreshOnce];
}
-(void)footerLoadImageStop{
    BIDMainFooterView *footerview=(BIDMainFooterView *)self.tableView.tableFooterView;
    footerview.LoadingImage.hidden=YES;
}
#pragma get the user id

-(void)setTtileName{
    NSString *username=[BIDCommeMeathod getuserName];
   [self setTitle:username];
}


#pragma tableviewDelegate
#pragma 
/*section count*/
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
/*row count*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return posters.count;
}
/*cell */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndetifier=@"MaincellIndetifiler";
    BIDMainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    
    if (cell==nil) {
        cell=[[BIDMainTableViewCell alloc]initItentifier:cellIndetifier];
        cell.delegate=self;
    }
    NSInteger rownum=indexPath.row;
    NSDictionary *poster=[posters objectAtIndex:rownum];
    NSLog(@"%@",poster);
    cell.Username.text=[poster objectForKey:@"User_Name"];
    cell.PosterContent.text=[poster objectForKey:@"PosterInput"];
    cell.Scores=[poster objectForKey:@"ScoresNum"];
    cell.posterId=[poster objectForKey:@"PosterID"];
    cell.ownerId=[poster objectForKey:@"User_ID"];
    cell.voteFlag=[poster objectForKey:@"VoteFlag"];
 
    NSString *str_photourl=[poster objectForKey:@"UserPhoto"];
    if (![str_photourl isEqualToString:@""]) {
        NSString *mainurl=@Key_MainUrl;
        str_photourl=[mainurl stringByAppendingString:str_photourl];
        NSURL *photoUrl=[NSURL URLWithString:str_photourl];
        [cell.UserImage sd_setImageWithURL:photoUrl];
    }

    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BIDMainTableViewCell *cell=(BIDMainTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return [cell cellHeight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  //  [self performSegueWithIdentifier:@"ToPosterDetail" sender:self];
}
#pragma BIDMainController delegate
#pragma didselected
-(void)didSelected{
    
}
#pragma userImageClick
-(void)UserImageClick{
    [self performSegueWithIdentifier:@"ToPosterDetail" sender:self];
    NSLog(@"to user info");
}
@end
