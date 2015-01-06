//
//  BIDAFNetWork.h
//  Dessert_v1
//
//  Created by fengxi on 14-12-6.
//  Copyright (c) 2014年 KeithMorning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@protocol BIDAFNetWork
@end
@interface BIDAFNetWork : NSObject{
   // __block void(^GetFromNetWork)(NSDictionary * resultDic);
}
/*!
 * @brief POST 输入参数，URL字符串返回字典
 * @param 输入参数字典，URL字符串
 * @return 返回字典
 */
+(void)PostDataFromNet:(NSString *)urlstring InputParas:(NSDictionary *)inputParas success:(void(^)(NSDictionary * resultDic))success failure:(void(^)(NSError *error))failure;
/*!
 * @brief Get 输入URL字符串返回字典
 * @param 输入参数字典，URL字符串
 * @return 返回字典
 */
+(void)GetDataFromNet:(NSString *)urlstring success:(void(^)(NSDictionary * resultDic))success failure:(void(^)(NSError *error))failure;
/*!
 *@brief upload the image
 *@param image to nsdata后发送
 */
+(void)upLoadImage:(UIImage *)image Urlstring:(NSString *)path name:(NSString *)name
           successBlock:(void(^)(AFHTTPRequestOperation *operation,id responseObject))success
           failureBlcok:(void(^)(AFHTTPRequestOperation *operation,NSError *error))failure
      processBlock:(void(^)(CGFloat processvalue))process;
@end
