//
//  BIDNewPosterController.m
//  Dessert_v1
//
//  Created by fengxi on 14-12-9.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import "BIDNewPosterController.h"

@interface BIDNewPosterController ()

@end

@implementation BIDNewPosterController

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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%@",segue.destinationViewController);
    NSLog(@"sdasd");
}

- (IBAction)Posterpost:(id)sender {
    [self NewPoster];
}
#pragma MMPressHUD function
-(void)HUDShow{
    [ProgressHUD show:@"Fly..."];
}
-(void)HUDDismiss{
    [ProgressHUD showSuccess:@"Success..."];
}


#pragma newposter
-(void)NewPoster{
    BIDPoster *poster=[[BIDPoster alloc]init];
    poster.PosterInput=self.PosterText.text;
    poster.User_ID=[BIDAccount GetAccount].user_id;
    poster.Title=@"this tiel";
    poster.PostTime=[BIDCommeMeathod MakeJsonDate:[NSDate date]];
    
    NSDictionary *postedictionary=[BIDObjectToNsDictionary getObjectData:poster];
    NSDictionary *newPoster=[[NSDictionary alloc]initWithObjectsAndKeys:postedictionary,@"newPoster", nil];
    NSString *url=[[NSString alloc]initWithFormat:@"%@%@",@PoserUrl,@savePosterUrl];
    [self HUDShow];
    [BIDAFNetWork PostDataFromNet:url InputParas:newPoster success:^(NSDictionary *resultDic) {
        NSString *result=[[NSString alloc]initWithFormat:@"%@",[resultDic objectForKey:@"SavePosterResult"]];
        if ([result isEqualToString:KEY_POST_SUCCESS]) {
            BIDPosterCellModel *cellmodel=[[BIDPosterCellModel alloc]init];
            [cellmodel GetPostersFromNet:0 pageEnd:10];
            [self.navigationController popViewControllerAnimated:YES];
            [self HUDDismiss];
            
        }else{
            
            NSLog(@"post failed");
        }
        
    } failure:^(NSError *error) {
        NSLog(@"create new poster failed %@",error);
    }];
}
@end
