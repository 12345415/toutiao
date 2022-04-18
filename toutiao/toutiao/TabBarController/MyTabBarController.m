//
//  MyTabBarController.m
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import "MyTabBarController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //tabbar背景颜色
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    [self initTabBarController];
    
}

#pragma mark ---getter---
- (UITabBarController *)tabbar {
    if (!_tabbar) {
        _tabbar = [[UITabBarController alloc] init];
    }
    return _tabbar;
}

#pragma mark ---init---
- (void)initTabBarController {
    OneViewController *oneVC = [[OneViewController alloc] init];
    oneVC.tabBarItem.title = @"首页";
    oneVC.tabBarItem.image = [UIImage addImage];
    //oneVC.title = @"首页";
    UINavigationController *oneNav = [[UINavigationController alloc] initWithRootViewController:oneVC];
    [self addChildViewController:oneNav];
    
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    twoVC.tabBarItem.title = @"放映厅";
    twoVC.title = @"放映";
    twoVC.tabBarItem.image = [UIImage actionsImage];
    UINavigationController *twoNav = [[UINavigationController alloc] initWithRootViewController:twoVC];
    [self addChildViewController:twoNav];
    
    UIViewController *threeVC = [[UIViewController alloc] init];
    threeVC.tabBarItem.title = @"视频";
    threeVC.tabBarItem.image = [UIImage removeImage];
    threeVC.title = @"视频";
    UINavigationController *threeNav = [[UINavigationController alloc] initWithRootViewController:threeVC];
    [self addChildViewController:threeNav];

    UIViewController *fourVC = [[UIViewController alloc] init];
    fourVC.tabBarItem.title = @"我的";
    fourVC.title = @"我的";
    fourVC.tabBarItem.image = [UIImage strokedCheckmarkImage];
    UINavigationController *fourNav = [[UINavigationController alloc] initWithRootViewController:fourVC];
    [self addChildViewController:fourNav];
}

@end
