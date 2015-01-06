//
//  BIDNewPoster.h
//  FateApp
//
//  Created by fengxi on 14-11-20.
//  Copyright (c) 2014年 fengxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BIDJsonConn.h"
#import "BIDPoster.h"
#import "BIDCommcode.h"
#import "BIDCommeMeathod.h"
#import "BIDObjectToNsDictionary.h"
#import "BIDUser.h"
@interface BIDNewPoster : UIViewController<JsonConnDeleage>
{
    NSString *title;
    NSString *content;
    BIDPoster *poster;
    BIDJsonConn *conn;
    
}
- (IBAction)PosterCommit:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *posterTextView;
@end
