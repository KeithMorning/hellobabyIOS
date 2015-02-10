//
//  BIDPosterDetailController.m
//  Dessert_v1
//
//  Created by fengxi on 14-12-9.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import "BIDPosterDetailController.h"
#import "KMMessagView.h"
#import "BIDPosterDetailHeader.h"
#import "UIView+subline.h"
@interface BIDPosterDetailController ()
@property (nonatomic,strong)UITableView *myTableView;
@end

@implementation BIDPosterDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadView{
    [super loadView];
    CGRect viewframe=[UIScreen mainScreen].bounds;
    self.view=[[UIView alloc]initWithFrame:viewframe];
    _myTableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier: @"TitleValueCell"];
         BIDPosterDetailHeader *Postercell=[[BIDPosterDetailHeader alloc]init];
        [Postercell addSubLine:[UIColor lightGrayColor] WithborderWidth:1.0];
        tableView.tableHeaderView=Postercell;
        [self.view addSubview:tableView];
        
        tableView;
    });
    CGSize size=[UIScreen mainScreen].bounds.size;
    CGRect frame=CGRectMake(0,size.height, size.width, 45);
    KMMessagView *messagebox=[[KMMessagView alloc]initWithFrame:frame PlaceText:@"评论" PlaceColor:[UIColor lightGrayColor]];
    [messagebox sendMessage:^(NSString *text) {
        NSLog(@"send:%@",text);
    }];
    [self.view addSubview:messagebox];


}


#pragma mark tabelView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *tablecell=[[UITableViewCell alloc]init];
    tablecell.textLabel.text=@"good";
    tablecell.imageView.image=[UIImage imageNamed:@"placeholderRound25@2x"];
    return tablecell;

    
}
@end
