//
//  AdView.m
//  uidemo
//
//  Created by qingqing on 16/3/9.
//  Copyright © 2016年 qingqing. All rights reserved.
//

#import "AdBannerView.h"
#import "UIImageView+WebCache.h"

#define ADRGB(r, g, b)  [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue: b / 255.0f alpha:1]

@interface AdBannerView()

@property (nonatomic, assign) int adType;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) NSLayoutConstraint *tipTopConstraint;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;

@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation AdBannerView

- (void)dealloc{
    NSLog(@">>>>>>>>>>AdBannerView dealloc");
}

- (instancetype)initWithAdType:(int)adType {
    self = [super init];
    if(self){
        self.adType = adType;
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 0.5f;
        self.layer.borderColor = ADRGB(221, 221, 221).CGColor;
        
        self.tipLabel = [[UILabel alloc] init];
        self.tipLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.tipLabel.font = [UIFont systemFontOfSize:14];
        self.tipLabel.textColor = [UIColor blackColor];
        [self addSubview:self.tipLabel];
        
        UILabel *cTipLabel = self.tipLabel;
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[cTipLabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(cTipLabel)]];
        
        self.tipTopConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[cTipLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(cTipLabel)].firstObject;
        [self addConstraint:self.tipTopConstraint];
        
        UIControl *contentView = [[UIControl alloc] init];
        contentView.translatesAutoresizingMaskIntoConstraints = NO;
        contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:contentView];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[contentView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(contentView)]];
        
        if(adType == 0){
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[cTipLabel]-[contentView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(contentView, cTipLabel)]];
            
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.translatesAutoresizingMaskIntoConstraints = NO;
            imageView.clipsToBounds = YES;
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.backgroundColor = [UIColor greenColor];
            [contentView addSubview:imageView];
            
            self.imageView = imageView;
            
            [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(imageView)]];
            [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(imageView)]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeHeight multiplier:3 constant:0]];
            
            UIView *bottomView = [[UIView alloc] init];
            bottomView.translatesAutoresizingMaskIntoConstraints = NO;
            bottomView.backgroundColor = ADRGB(251, 251, 251);
            [contentView addSubview:bottomView];
            
            [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bottomView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(bottomView)]];
            [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[imageView][bottomView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(imageView,bottomView)]];
            
            UILabel *tLabel = [[UILabel alloc] init];
            tLabel.translatesAutoresizingMaskIntoConstraints = NO;
            tLabel.text = @"推广";
            tLabel.layer.masksToBounds = YES;
            tLabel.layer.cornerRadius = 3.0f;
            tLabel.textColor = ADRGB(114, 114, 114);
            tLabel.font = [UIFont systemFontOfSize:14];
            tLabel.layer.borderWidth = 1.0f;
            tLabel.layer.borderColor = ADRGB(114, 114, 114).CGColor;
            tLabel.textAlignment = NSTextAlignmentCenter;
            [bottomView addSubview:tLabel];
            
            [bottomView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tLabel(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tLabel)]];
            [bottomView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[tLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tLabel)]];
            
            UIImage *arrowImage = [UIImage imageNamed:@"ad_arrow"];
            UIImageView *arrowView = [[UIImageView alloc] init];
            arrowView.translatesAutoresizingMaskIntoConstraints = NO;
            arrowView.image = arrowImage;
            [bottomView addSubview:arrowView];
            
            [bottomView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:[arrowView(%f)]|", arrowImage.size.width] options:0 metrics:nil views:NSDictionaryOfVariableBindings(arrowView)]];
            [bottomView addConstraint:[NSLayoutConstraint constraintWithItem:arrowView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:bottomView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
            
            UILabel *titleLabel = [[UILabel alloc] init];
            titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
            titleLabel.font = [UIFont systemFontOfSize:15];
            titleLabel.textColor = ADRGB(114, 114, 114);
            titleLabel.text = @"通知：原定会议日程有变化，明天按正常时间上班。";
            [bottomView addSubview:titleLabel];
            
            self.titleLabel = titleLabel;
            
            [bottomView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[tLabel]-[titleLabel]-[arrowView]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(titleLabel,tLabel, arrowView)]];
        }
        else if(adType == 1 || adType == 2){
            contentView.backgroundColor = ADRGB(248, 248, 248);
            
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[cTipLabel]-[contentView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(contentView, cTipLabel)]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:contentView attribute:NSLayoutAttributeHeight multiplier:3 constant:0]];
            
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.translatesAutoresizingMaskIntoConstraints = NO;
            imageView.clipsToBounds = YES;
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.backgroundColor = [UIColor greenColor];
            [contentView addSubview:imageView];
            
            self.imageView = imageView;
            
            [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(imageView)]];
            [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(imageView)]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeHeight multiplier:3 constant:0]];
            float multiplier = adType == 1 ? 1 : 1.3f;
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeHeight multiplier:multiplier constant:0]];
            
            UIView *rightView = [[UIView alloc] init];
            rightView.translatesAutoresizingMaskIntoConstraints = NO;
            [contentView addSubview:rightView];
            
            [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[imageView]-[rightView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(imageView, rightView)]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:rightView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
            
            UILabel *titleLabel = [[UILabel alloc] init];
            titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
            titleLabel.font = [UIFont boldSystemFontOfSize:18];
            titleLabel.text = @"热信用户调查表";
            [rightView addSubview:titleLabel];
            
            self.titleLabel = titleLabel;
            
            [rightView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[titleLabel]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(titleLabel)]];
            [rightView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[titleLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(titleLabel)]];
            
            UILabel *subtitleLabel = [[UILabel alloc] init];
            subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
            subtitleLabel.font = [UIFont systemFontOfSize:14];
            subtitleLabel.textColor = ADRGB(142, 142, 142);
            subtitleLabel.text = @"通知：原定会议日程有变化，明天按正常时间上班。";
            subtitleLabel.numberOfLines = 2;
            [rightView addSubview:subtitleLabel];
            
            self.subtitleLabel = subtitleLabel;
            
            [rightView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subtitleLabel]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subtitleLabel)]];
            [rightView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[titleLabel]-[subtitleLabel]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(titleLabel, subtitleLabel)]];
        }
        else if(adType == 3){
            contentView.backgroundColor = ADRGB(248, 248, 248);
            
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[cTipLabel]-[contentView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(contentView, cTipLabel)]];
            
            UILabel *tLabel = [[UILabel alloc] init];
            tLabel.translatesAutoresizingMaskIntoConstraints = NO;
            tLabel.text = @"推广";
            tLabel.textColor = [UIColor whiteColor];
            tLabel.font = [UIFont systemFontOfSize:14];
            tLabel.textAlignment = NSTextAlignmentCenter;
            tLabel.backgroundColor = ADRGB(145, 204, 252);
            [contentView addSubview:tLabel];
            
            [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[tLabel(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tLabel)]];
            [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[tLabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tLabel)]];
            
            UIImage *arrowImage = [UIImage imageNamed:@"ad_arrow"];
            UIImageView *arrowView = [[UIImageView alloc] init];
            arrowView.translatesAutoresizingMaskIntoConstraints = NO;
            arrowView.image = arrowImage;
            [contentView addSubview:arrowView];
            
            [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:[arrowView(%f)]-|", arrowImage.size.width] options:0 metrics:nil views:NSDictionaryOfVariableBindings(arrowView)]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:arrowView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
            
            UILabel *titleLabel = [[UILabel alloc] init];
            titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
            titleLabel.font = [UIFont systemFontOfSize:15];
            titleLabel.textColor = ADRGB(114, 114, 114);
            titleLabel.text = @"通知：原定会议日程有变化，明天按正常时间上班。";
            [contentView addSubview:titleLabel];
            
            self.titleLabel = titleLabel;
            
            [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[tLabel]-[titleLabel]-[arrowView]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(titleLabel,tLabel, arrowView)]];
        }
    }
    return self;
}

- (void)setCountdown:(BOOL)countdown {
    _countdown = countdown;
    
    if(_countdown) {
        self.tipTopConstraint.constant = 8;
        
        __block int totalSecond = 1000;
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        if(self.timer){
            dispatch_source_cancel(self.timer);
            self.timer = nil;
        }
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(self.timer, dispatch_walltime(nil, 0), 1 * NSEC_PER_SEC, 0);
        __weak AdBannerView *weakSelf = self;
        dispatch_source_set_event_handler(self.timer, ^{
            if(totalSecond <= 0){
                dispatch_source_cancel(weakSelf.timer);
                NSLog(@">>>>>>>>>>cancel");
            }
            else{
                totalSecond--;
            }
            NSLog(@">>>>>>>>>>totalSecond %d", totalSecond);
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.tipLabel.text = [NSString stringWithFormat:@"%d秒后获得广告收益", totalSecond];
            });
        });
        dispatch_resume(self.timer);
    }
    else {
        self.tipTopConstraint.constant = 0;
        self.tipLabel.text = nil;
    }
}

- (void)update:(NSString *)picUrl title:(NSString *)title subtitle:(NSString *)subtitle {
    if(self.adType == 0 || self.adType == 1 || self.adType == 2){
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:picUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
        }];
        if(self.adType == 0){
            self.titleLabel.text = title;
        }
        else {
            self.titleLabel.text = title;
            self.subtitleLabel.text = subtitle;
        }
    }
    else {
        self.titleLabel.text = title;
    }
}

- (CGFloat)getHeight {
    int adType = 3;
    CGFloat height = 16 + 20;
    
    float contentWidth = CGRectGetWidth(self.bounds) - 8 * 2;
    float contentHeight = contentWidth / 3;
    
    if(adType == 0){
        height += contentHeight;
        height += 35;
    }
    else if(adType == 1 || adType == 2){
        height += contentHeight;
        height += 8;
    }
    else if(adType == 3){
        height += 8;
        height += 20;
        height += 8;
        height += 8;
    }
    return height;
}

@end
