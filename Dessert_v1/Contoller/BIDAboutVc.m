//
//  BIDAboutVc.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-3.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "BIDAboutVc.h"
#import  "BIDAFNetWork.h"
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

- (IBAction)changeImage:(id)sender {
    UIActionSheet *actionsheet=[[UIActionSheet alloc]initWithTitle:@"更换头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册", nil];
    [actionsheet showInView:[UIApplication sharedApplication].keyWindow];
}
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
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *editedImage,*orginalImage;
    editedImage=[info objectForKey:UIImagePickerControllerEditedImage];
    
    [BIDAFNetWork upLoadImage:editedImage Urlstring:@"UploadFile" name:@"file" successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success");
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
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error==nil) {
        NSLog(@"save successfully");
    }else{
        NSLog(@"save failed %@",error);
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
