//
//  TabBarViewController.m
//  RTNavigationDemo
//
//  Created by 宋海梁 on 16/7/8.
//  Copyright © 2016年 宋海梁. All rights reserved.
//

#import "TabBarViewController.h"
#import "ViewController.h"
#import "ViewController2.h"
#import "RTRootNavigationController.h"
#import <RDVTabBarItem.h>

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ViewController"];
    ViewController2 *vc2 = [sb instantiateViewControllerWithIdentifier:@"ViewController2"];
    RTRootNavigationController *nav1 = [[RTRootNavigationController alloc] initWithRootViewController:vc];
    RTRootNavigationController *nav2 = [[RTRootNavigationController alloc] initWithRootViewController:vc2];
    
    self.viewControllers = @[nav1,nav2];
    
    NSInteger index=1;
    for (RDVTabBarItem *tabitem in [[self tabBar] items]) {
        
        UIImage *imgSelected = [UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%@_selected",@(index)]];
        UIImage *imgUnselected = [UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%@_normal",@(index)]];
        
        [tabitem setFinishedSelectedImage:imgSelected withFinishedUnselectedImage:imgUnselected];
        
        switch (index) {
            case 1:
                [tabitem setTitle:@"AA"];
                break;
            case 2:
                [tabitem setTitle:@"BB"];
                break;
            default:
                break;
        }
        
        index++;
    }
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
