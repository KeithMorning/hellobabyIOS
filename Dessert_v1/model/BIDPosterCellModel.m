//
//  BIDPosterCellModel.m
//  Dessert_v1
//
//  Created by fengxi on 14-12-10.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import "BIDPosterCellModel.h"
#import "BIDCommcode.h"
@implementation BIDPosterCellModel

-(void)GetPostersFromNet:(int)pageStart pageEnd:(int)pageEnd{
    BIDAccount *account=[BIDAccount GetAccount];
    NSString *url=[[NSString alloc]initWithFormat:@"%@%@/%@/%d/%d",@PoserUrl,@urlGetPoster,account.user_id,pageStart,pageEnd];
    [BIDAFNetWork GetDataFromNet:url success:^(NSDictionary *resultDic) {
        self.posterCells=resultDic;
    } failure:^(NSError *error) {
        NSLog(@"main view get poster failed %@",error);
    }];
}
-(void)setPosterCells:(NSDictionary *)posterCells{
    NSNotificationCenter *center=[NSNotificationCenter defaultCenter];
    [center postNotificationName:@"PosterCellDataReady" object:self userInfo:posterCells];
}

@end
