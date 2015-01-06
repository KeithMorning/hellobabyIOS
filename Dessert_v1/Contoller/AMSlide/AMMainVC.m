//
//  AMMainVC.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-2.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "AMMainVC.h"

@interface AMMainVC ()

@end

@implementation AMMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString *)segueIdentifierForIndexPathInLeftMenu:(NSIndexPath *)indexPath{
    NSString *segueIndetifier;
    switch (indexPath.row) {
        case 0:
        segueIndetifier=@"mainPage";
            break;
        case 1:
            segueIndetifier=@"userselfInfo";
            break;
        case 2:
            segueIndetifier=nil;
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        case 3:
            segueIndetifier=@"aboutDessert";
    }
    return segueIndetifier;
    
}
-(BOOL)deepnessForLeftMenu{
    return YES;
}
-(void)configureLeftMenuButton:(UIButton *)button{
    CGRect frame = button.frame;
    frame = CGRectMake(0, 0, 25, 13);
    button.frame = frame;
    button.backgroundColor = [UIColor clearColor];
    [button setImage:[UIImage imageNamed:@"simpleMenuButton"] forState:UIControlStateNormal];
}
- (UIViewAnimationOptions) openAnimationCurve {
    return UIViewAnimationOptionCurveEaseOut;
}

- (UIViewAnimationOptions) closeAnimationCurve {
    return UIViewAnimationOptionCurveEaseOut;
}
- (void) configureSlideLayer:(CALayer *)layer
{
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = 1;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowRadius = 5;
    layer.masksToBounds = NO;
    layer.shadowPath =[UIBezierPath bezierPathWithRect:self.view.layer.bounds].CGPath;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
