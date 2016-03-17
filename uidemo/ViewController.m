//
//  ViewController.m
//  uidemo
//
//  Created by qingqing on 16/1/11.
//  Copyright © 2016年 qingqing. All rights reserved.
//

#import "ViewController.h"
#import "uidemo-Swift.h"
#import "CustomCell.h"
#import "UIImageView+WebCache.h"
#import "JSONModelLib.h"
#import "DiscoverModel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *iTableView;
@property(nonatomic, strong) NSMutableArray *lst;

@end

@implementation ViewController

- (void)dealloc
{
    if(self.lst)
    {
        [self.lst removeAllObjects];
        self.lst = nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"uidemo";
    
    self.lst = [NSMutableArray array];
    [self.lst addObject:@"TestViewController"];
    [self.lst addObject:@"ClosureViewController"];
    [self.lst addObject:@"EnumViewController"];
    [self.lst addObject:@"FuncViewController"];
    [self.lst addObject:@"AlamofireViewController"];
    [self.lst addObject:@"TimeViewController"];
    [self.lst addObject:@"LabelViewController"];
    
    
    [self.iTableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"kCell"];
    
    UIImageView *picView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [self.iTableView addSubview:picView];
    
    [picView sd_setImageWithURL:[NSURL URLWithString:@"http://180.235.65.220:4869/5d596a429582e230a66251ff4c72abb0"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@">>>>>>>>>>image width %f, height %f", image.size.width, image.size.height);
    }];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"json" ofType:@"txt"];
    NSString *jsonStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    DiscoverModel *discoverModel = [[DiscoverModel alloc] initWithString:jsonStr error:nil];
    ContextModel *contextModel = discoverModel.context[0];
    NSLog(@">>>>>>>>>>discoverModel %@", discoverModel.context);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lst.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kCell = @"kCell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:kCell];
    cell.titleLabel.text = self.lst[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = self.lst[indexPath.row];
    id obj = [[NSClassFromString(title) alloc] init];
    [self.navigationController pushViewController:obj animated:YES];
}

@end
