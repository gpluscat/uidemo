//
//  TimeViewController.m
//  uidemo
//
//  Created by qingqing on 16/3/9.
//  Copyright © 2016年 qingqing. All rights reserved.
//

#import "TimeViewController.h"
#import "AdBannerView.h"

@interface TimeViewController ()<UITextViewDelegate>

@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    AdBannerView *adView = [[AdBannerView alloc] initWithAdType:2];
    adView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:adView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[adView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(adView)]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:adView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"This is an example by @marcelofabri_"];
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"username://marcelofabri_"
                             range:[[attributedString string] rangeOfString:@"@marcelofabri_"]];
    
    
    NSDictionary *linkAttributes = @{NSForegroundColorAttributeName: [UIColor greenColor],
                                     NSUnderlineColorAttributeName: [UIColor lightGrayColor],
                                     NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 64, 300, 200)];
    [self.view addSubview:textView];
    
    // assume that textView is a UITextView previously created (either by code or Interface Builder)
    textView.editable = NO;
    textView.linkTextAttributes = linkAttributes; // customizes the appearance of links
    textView.attributedText = attributedString;
    textView.delegate = self;
    
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    NSLog(@">>>>>>>>>>%@", [URL scheme]);
    if ([[URL scheme] isEqualToString:@"username"]) {
        NSString *username = [URL host];
        // do something with this username
        // ...
        
        return NO;
    }
    return YES; // let the system open this URL
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

@end
