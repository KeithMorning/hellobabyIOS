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
#import "KMMessagView.h"
@interface BIDAboutVc ()
@property (nonatomic,strong)UITableView *myTableView;
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
-(void)loadView{
    [super loadView];
    CGRect viewframe=[UIScreen mainScreen].bounds;
    //viewframe.size.height-=(44);
    self.view=[[UIView alloc]initWithFrame:viewframe];
    _myTableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
       // tableView.backgroundColor = kColorTableSectionBg;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
       [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier: @"TitleValueCell"];
        [self.view addSubview:tableView];
        tableView;
    });
    CGSize size=[UIScreen mainScreen].bounds.size;
    NSLog(@"%f",size.height);
    CGRect frame=CGRectMake(0,size.height, size.width, 45);
    KMMessagView *messagebox=[[KMMessagView alloc]initWithFrame:frame PlaceText:@"评论" PlaceColor:[UIColor lightGrayColor]];
    [messagebox sendMessage:^(NSString *text) {
        NSLog(@"send:%@",text);
    }];
    [self.view addSubview:messagebox];
    [self.view setBackgroundColor:[UIColor redColor]];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"good"];
    cell.textLabel.text=[NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}
@end
