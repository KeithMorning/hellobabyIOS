//
//  BIDMeInfoVC.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-2.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "BIDMeInfoVC.h"
#import "BIDCommcode.h"
#import "BIDLabelValueViewCell.h"
#import "BIDLableImageViewCell.h"
#import "BIDAFNetWork.h"
@interface BIDMeInfoVC ()

@end
static NSString *cellLableValue=@"cellLabelValue";
static NSString *cellLableImage=@"cellLableImage";
@implementation BIDMeInfoVC


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"个人信息";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillDisappear:(BOOL)animated
{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0 &&indexPath.section==0) {//头像单元
    BIDLableImageViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellLableImage];
    if (cell==nil) {
        cell=[[BIDLableImageViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellLableImage];
    }
    return  cell;
    }
    else{//信息单元
        
        BIDLabelValueViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellLableValue];
        if (cell==nil) {
            cell=[[BIDLabelValueViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellLableValue];
        }
        switch (indexPath.section) {
            case 0:
                switch (indexPath.row) {
                    case 1://email
                        [cell setCellTile:@"Email" setCellValue:[BIDAccount GetAccount].Email];
                        break;
                    case 2://Sex
                        [cell setCellTile:@"性别" setCellValue:[BIDAccount GetAccount].Sex];
                        break;
                    default:
                        break;
                }
                break;
                
            default:
                break;
        }
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat cellheight;
    if (indexPath.section==0 &&indexPath.row==0) {
        cellheight=[BIDLableImageViewCell cellHeight];
    }else{
        cellheight=[BIDLabelValueViewCell rowHeight];
    }
    return cellheight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    __weak typeof(self) weakself=self;
    switch (indexPath.section) {
        case 0://第一分组
            switch (indexPath.row) {
                case 0://头像
                    [weakself changeUserPhoto];
                    break;
                    
                case 1:
                    
                    break;
            }
            break;
            
        default:
            break;
    }
    
}

-(void)changeUserPhoto{
    UIActionSheet *actionsheet=[[UIActionSheet alloc]initWithTitle:@"更换头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册", nil];
    [actionsheet showInView:[UIApplication sharedApplication].keyWindow];
}

#pragma actionSheet delegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==2) {
        return;
    }
    UIImagePickerController *imagepickervc=[[UIImagePickerController alloc]init];
    imagepickervc.allowsEditing=YES;
    imagepickervc.delegate=self;
    switch (buttonIndex) {
        case 0:
            imagepickervc.sourceType=UIImagePickerControllerSourceTypeCamera;
            break;
        case 1:
            imagepickervc.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
            break;
    }
    [self presentViewController:imagepickervc animated:YES completion:nil];
}

#pragma imagePickerController delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *editedImage,*orginalImage;
    editedImage=[info objectForKey:UIImagePickerControllerEditedImage];
    
    [BIDAFNetWork upLoadImage:editedImage Urlstring:@"UploadFile" name:[self CreateUserImageName] successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success %@",responseObject);
        [BIDAccount GetAccount].PhotoUrl=[responseObject objectForKey:@"SaveImageResult"];
        [self.tableView reloadData];
    } failureBlcok:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failed,%@",error);
    } processBlock:^(CGFloat processvalue) {
        NSLog(@"%f",processvalue);
    }];
    
    if (picker.sourceType==UIImagePickerControllerSourceTypeCamera) {
        orginalImage=[info objectForKey:UIImagePickerControllerOriginalImage];
        SEL selectorToCall=@selector(image:didFinishSavingWithError:contextInfo:);
        UIImageWriteToSavedPhotosAlbum(orginalImage, self, selectorToCall, NULL);
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma if this save success
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error==nil) {
        NSLog(@"save successfully");
    }else{
        NSLog(@"save failed %@",error);
    }
}
#pragma imagePickerController cancel
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
#pragma  create the photo name
-(NSString *)CreateUserImageName{
    BIDAccount *account=[BIDAccount GetAccount];
    NSString *userId=account.user_id;
    NSDateFormatter *dateForm=[[NSDateFormatter alloc]init];
    [dateForm setDateFormat:@"yyyyMMddHHmmss"];
    NSString *date_str=[dateForm stringFromDate:[NSDate date]];
    NSString *createName=[NSString stringWithFormat:@"%@_%@.jpg",date_str,userId];
    return createName;
}

@end
