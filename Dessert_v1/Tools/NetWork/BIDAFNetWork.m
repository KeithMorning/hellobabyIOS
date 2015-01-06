//
//  BIDAFNetWork.m
//  Dessert_v1
//
//  Created by fengxi on 14-12-6.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import "BIDAFNetWork.h"
#import "BIDCommcode.h"

@implementation BIDAFNetWork
+(void)PostDataFromNet:(NSString *)urlstring InputParas:(NSDictionary *)inputParas success:(void(^)(NSDictionary * resultDic))success failure:(void(^)(NSError *error))failure{
    AFHTTPRequestOperationManager *requestMange=[AFHTTPRequestOperationManager manager];
    requestMange.requestSerializer=[AFJSONRequestSerializer serializer];
    requestMange.responseSerializer=[AFJSONResponseSerializer serializerWithReadingOptions:NSJapaneseEUCStringEncoding];
    [requestMange POST:urlstring parameters:inputParas success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}
+(void)GetDataFromNet:(NSString *)urlstring success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure{
    AFHTTPRequestOperationManager *requestManger=[AFHTTPRequestOperationManager manager];
    requestManger.requestSerializer=[AFJSONRequestSerializer serializer];
    requestManger.responseSerializer=[AFJSONResponseSerializer serializerWithReadingOptions:NSJapaneseEUCStringEncoding];
    [requestManger GET:urlstring parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
           failure(error);
    }];
}

+(void)upLoadImage:(UIImage *)image Urlstring:(NSString *)path name:(NSString *)name successBlock:(void (^)(AFHTTPRequestOperation *,id responseObject))success failureBlcok:(void (^)(AFHTTPRequestOperation *, NSError *))failure processBlock:(void (^)(CGFloat))process{

    NSData *imagedata=UIImageJPEGRepresentation(image, 1.0);
    if ((float)imagedata.length/1024>1000) {
        imagedata=UIImageJPEGRepresentation(image, 1024*1000/(float)imagedata.length);
    }
    NSLog(@"imagedata size :%lu",imagedata.length);
    NSString *filename=@"test.jpg";
    AFHTTPRequestOperationManager *AFManager=[[AFHTTPRequestOperationManager alloc]initWithBaseURL:[NSURL URLWithString:@FileTranUrl]];
    AFHTTPRequestOperation *operation=[AFManager POST:path parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formdata){[formdata appendPartWithFileData:imagedata name:name fileName:filename mimeType:@"image/jpeg"];} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(operation,responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation,error);
        }
    }];
    [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        CGFloat progressValue = (float)totalBytesWritten/(float)totalBytesExpectedToWrite;
        if (process) {
            process(progressValue);
        }
    }];
    [operation start];
}

@end
