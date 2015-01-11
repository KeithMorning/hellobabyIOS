//
//  NSString+comm.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-11.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "NSString+comm.h"

@implementation NSString (comm)
-(CGSize)getCGSizeWithFont:(UIFont*)font constrainedSize:(CGSize)size{
    CGSize stringsize=CGSizeZero;
    if (self.length<=0) {
        return stringsize;
    }
    if (NSFoundationVersionNumber>NSFoundationVersionNumber_iOS_6_1) {
        stringsize=[self boundingRectWithSize:size options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:font} context:nil].size;
    }else{
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
               stringsize= [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
#endif
    }
    stringsize=CGSizeMake(MIN(size.width,ceilf(stringsize.width)), MIN(size.height, ceilf(stringsize.height)));//ceif 返回大于或等于该输入值的最小整数
    return stringsize;
}
@end
