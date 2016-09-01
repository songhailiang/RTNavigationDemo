//
//  DetailController.m
//  RTNavigationDemo
//
//  Created by 宋海梁 on 16/7/8.
//  Copyright © 2016年 宋海梁. All rights reserved.
//

#import "DetailController.h"
#import <IQKeyboardManager.h>

@interface DetailController ()<UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate,UISearchResultsUpdating,UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;

@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation DetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"详情";
    
    //搜索框
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    //    self.searchController.searchBar.tintColor = [UIColor redColor]; //这个可以修改 取消 按钮的颜色
    self.searchController.dimsBackgroundDuringPresentation = NO;
    [self.searchController.searchBar sizeToFit];
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.delegate = self;
    self.searchController.delegate = self;
    //    self.definesPresentationContext = YES;
    //    self.searchController.hidesNavigationBarDuringPresentation = NO;
    self.table.tableHeaderView = self.searchController.searchBar;
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    [IQKeyboardManager sharedManager].enable = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%@行",@(indexPath.row)];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"didEndDisplayingCell:第%@行",@(indexPath.row));
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailController *vc = [sb instantiateViewControllerWithIdentifier:@"DetailController"];
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - SearchBar

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSLog(@"search:%@",searchController.searchBar.text);
}

- (void)willPresentSearchController:(UISearchController *)searchController {
    self.navigationController.navigationBar.translucent = YES;
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    self.navigationController.navigationBar.translucent = NO;
}

@end
