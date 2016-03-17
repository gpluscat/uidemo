//
//  AdView.h
//  uidemo
//
//  Created by qingqing on 16/3/9.
//  Copyright © 2016年 qingqing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdBannerView : UIView

@property (nonatomic, assign) BOOL countdown;// 是否有计时

/**
 * adType 0, 1, 2, 3
 */
- (instancetype)initWithAdType:(int)adType;

- (void)update:(NSString *)picUrl title:(NSString *)title subtitle:(NSString *)subtitle;

@end
