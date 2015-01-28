//
//  ViewController.m
//  GoodMessagecell
//
//  Created by fengxi on 15-1-22.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "ViewController.h"
#import "GoodMessagebox.h"
@interface ViewController ()
@property (nonatomic,strong) GoodMessagebox *inputMessageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.palcetxt.placeText=@"写点什么吧";
    self.palcetxt.placeColor=[UIColor lightGrayColor];



    
}
-(void)layoutSublayersOfLayer:(CALayer *)layer{
    [super layoutSublayersOfLayer:layer];

}
-(void)loadView{
    [super loadView];
    
    if (!_inputMessageView) {
        CGRect frame=[[UIScreen mainScreen] bounds];
        _inputMessageView=[[GoodMessagebox alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(frame), CGRectGetWidth(frame), 45)];
        [self.view addSubview:_inputMessageView];
        [_inputMessageView sendMessage:^(NSString * text){
            NSLog(@"%@",text);
        }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reply:(id)sender {
    
}
@end
