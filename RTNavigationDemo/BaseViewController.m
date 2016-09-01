//
//  BaseViewController.m
//  RTNavigationDemo
//
//  Created by 宋海梁 on 16/7/8.
//  Copyright © 2016年 宋海梁. All rights reserved.
//

#import "BaseViewController.h"
#import "ViewController.h"
#import "ViewController2.h"
#import <RDVTabBarController.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent = NO;
    
    if ([self isKindOfClass:[ViewController class]] || [self isKindOfClass:[ViewController2 class]]) {
        [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
    }
    else {
        [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (BOOL)shouldAutorotate {
    return NO;
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
