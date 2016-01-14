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
    
    [self.iTableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"kCell"];
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
    if(indexPath.row == 0)
    {
        TestViewController *controller = [[TestViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if(indexPath.row == 1){
        ClosureViewController *controller = [[ClosureViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if(indexPath.row == 2) {
        EnumViewController *controller = [[EnumViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if(indexPath.row == 3) {
        FuncViewController *controller = [[FuncViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if(indexPath.row == 4) {
        AlamofireViewController *controller = [[AlamofireViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
