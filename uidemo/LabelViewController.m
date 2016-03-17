//
//  LabelViewController.m
//  uidemo
//
//  Created by qingqing on 16/3/15.
//  Copyright © 2016年 qingqing. All rights reserved.
//

#import "LabelViewController.h"
#import "TYAttributedLabel.h"

@interface LabelViewController ()<TYAttributedLabelDelegate>

@end

@implementation LabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    TYAttributedLabel *label = [[TYAttributedLabel alloc]init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.preferredMaxLayoutWidth = CGRectGetWidth(self.view.bounds) - 30;
    label.delegate = self;
    label.highlightedLinkColor = [UIColor redColor];
    label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[label]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)]];
    
//    // 文字间隙
//    label.characterSpacing = 2;
//    // 文本行间隙
//    label.linesSpacing = 6;
    
    
    NSString *linkText = @"破蛹而出";
    NSString *text = @"\t总有一天你将破蛹而出，#人民币#成长得比人们期待的还要美丽。\n";
    
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:text];
//    [attributedString addAttributeTextColor:[UIColor blueColor]];
//    [attributedString addAttributeFont:[UIFont systemFontOfSize:15]];
//    [label appendTextAttributedString:attributedString];
    
    label.text = text;
    
    TYLinkTextStorage *linkTextStorage = [[TYLinkTextStorage alloc] init];
    linkTextStorage.range = [text rangeOfString:linkText];
    linkTextStorage.textColor = [UIColor greenColor];
    linkTextStorage.linkData = @"333";
    linkTextStorage.underLineStyle = kCTUnderlineStyleNone;
    [label addTextStorage:linkTextStorage];
    
    [label addLinkWithLinkData:@"44" linkColor:[UIColor yellowColor] underLineStyle:kCTUnderlineStyleNone range:[text rangeOfString:@"#人民币#"]];
    
    int height = [label getHeightWithWidth:label.preferredMaxLayoutWidth];
    NSLog(@">>>>>>>>>>height %d", height);
    
}

- (void)attributedLabel:(TYAttributedLabel *)attributedLabel textStorageClicked:(id<TYTextStorageProtocol>)textStorage atPoint:(CGPoint)point
{
    if([textStorage isKindOfClass:[TYLinkTextStorage class]]){
        NSString *linkStr = ((TYLinkTextStorage *)textStorage).linkData;
        NSLog(@">>>>>>>>>>linkStr %@", linkStr);
    }
}

- (void)attributedLabel:(TYAttributedLabel *)attributedLabel textStorageLongPressed:(id<TYTextStorageProtocol>)textStorage onState:(UIGestureRecognizerState)state atPoint:(CGPoint)point
{
    NSLog(@">>>>>>>>>>LongPressed");
}

@end
