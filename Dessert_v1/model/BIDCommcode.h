//
//  BIDCommcode.h
//  FateApp
//
//  Created by fengxi on 14-11-8.
//  Copyright (c) 2014年 fengxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#define KEY_LOGIN_NOT_PASS @"N"
#define KEY_LOGIN_PASS     @"P"
#define KEY_LOGIN_ERROR    @"E"
#define KEY_REGISTER_SUCCESS @"1"
#define KEY_REGISTER_ERROR  @"0"
#define KEY_POST_FAILED @"0"
#define KEY_POST_SUCCESS @"1"
#define  ServerUrl "http://192.168.211.1/ServiceForIOS.svc/"
#define PoserUrl "http://192.168.211.1/ServiceForIOSPoster.svc/"
#define FileTranUrl "http://192.168.211.1/ServiceForIOSFile.svc/"
//#define  ServerUrl "http://182.92.230.154:2122/ServiceForIOS.svc/"
//#define PoserUrl "http://182.92.230.154:2122/ServiceForIOSPoster.svc/"
#define getPosterResult @"GetPosterResult"



#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

//常用变量
#define DebugLog(s, ...) NSLog(@"%s(%d): %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#define kTipAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil] show]

#define kKeyWindow [UIApplication sharedApplication].keyWindow

#define kHigher_iOS_6_1 (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1)
#define kHigher_iOS_6_1_DIS(_X_) ([[NSNumber numberWithBool:kHigher_iOS_6_1] intValue] * _X_)
#define kNotHigher_iOS_6_1_DIS(_X_) (-([[NSNumber numberWithBool:kHigher_iOS_6_1] intValue]-1) * _X_)

#define kScreen_Bounds [UIScreen mainScreen].bounds
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kScreen_is_iPhone5_Plus ABS(kScreen_Width/kScreen_Height - 320.0/480.0) > 0.01
#define kPaddingLeftWidth 10.0
#define kCornerRadius 22.0
#define kMySegmentControl_Height 44.0
#define kMySegmentControlIcon_Height 70.0

#define  kBackButtonFontSize 16
#define  kNavTitleFontSize 19
#define  kBadgeTipStr @"badgeTip"

#define kDefaultLastId [NSNumber numberWithInteger:99999999]

#define kColor999 [UIColor colorWithHexString:@"0x999999"]
#define kColorTableBG [UIColor colorWithHexString:@"0xfafafa"]
#define kColorTableSectionBg [UIColor colorWithHexString:@"0xe5e5e5"]

#define kImage999 [UIImage imageWithColor:kColor999]

#define kPlaceholderMonkeyRoundWidth(_width_) [UIImage imageNamed:[NSString stringWithFormat:@"placeholder_monkey_round_%.0f", _width_]]
#define kPlaceholderMonkeyRoundView(_view_) [UIImage imageNamed:[NSString stringWithFormat:@"placeholder_monkey_round_%.0f", CGRectGetWidth(_view_.frame)]]

#define kPlaceholderCodingSquareWidth(_width_) [UIImage imageNamed:[NSString stringWithFormat:@"placeholder_coding_square_%.0f", _width_]]
#define kPlaceholderCodingSquareView(_view_) [UIImage imageNamed:[NSString stringWithFormat:@"placeholder_coding_square_%.0f", CGRectGetWidth(_view_.frame)]]

#define kUnReadKey_messages @"messages"
#define kUnReadKey_notifications @"notifications"
#define kUnReadKey_project_update_count @"project_update_count"
#define kUnReadKey_notification_AT @"notification_at"
#define kUnReadKey_notification_Comment @"notification_comment"
#define kUnReadKey_notification_System @"notification_system"
@interface BIDCommcode : NSObject{
    
}
@property  (atomic,copy) NSMutableString *User;
@end
