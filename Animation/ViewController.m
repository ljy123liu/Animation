//
//  ViewController.m
//  Animation
//
//  Created by LIUYONG on 16/6/27.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width
static NSString * const identifier = @"cell";

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataArray = @[@"BasicAnimationViewController",@"SpringAnimationViewController",@"DecayAnimationViewController",@"PropertyAnimationViewController"];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.dataArray[indexPath.row];
    Class cls = NSClassFromString(className);
    if (cls) {
        UIViewController *vc = [cls new];
        vc.navigationItem.title = self.dataArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    //取消返回时候的选中高亮状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
