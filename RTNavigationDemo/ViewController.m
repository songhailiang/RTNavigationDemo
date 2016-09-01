//
//  ViewController.m
//  RTNavigationDemo
//
//  Created by 宋海梁 on 16/7/8.
//  Copyright © 2016年 宋海梁. All rights reserved.
//

#import "ViewController.h"
#import <UINavigationBar+Awesome.h>

@interface ViewController ()<UIScrollViewDelegate>
- (IBAction)push:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self scrollViewDidScroll:self.scrollView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar lt_reset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)push:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    CGFloat yOffset  = scrollView.contentOffset.y;

    if (yOffset >= 0) {
        CGFloat alpha = MIN(1, yOffset / 64);
        
        [self.navigationController.navigationBar lt_setBackgroundColor:[[UIColor darkGrayColor] colorWithAlphaComponent:alpha]];
    }
    else {
        
        [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    }
}

@end
