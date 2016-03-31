//
//  SqViewController.h
//  uidemo
//
//  Created by qingqing on 16/3/28.
//  Copyright © 2016年 qingqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface SqViewController : UIViewController
{
    sqlite3 *db;
}

@end
