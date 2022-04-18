//
//  NewsContentView.m
//  toutiao
//
//  Created by lizhifm on 2022/4/16.
//

#import "NewsContentView.h"

@interface NewsContentView ()

@end

@implementation NewsContentView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initLeftButton];
    [self initRightButton];
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [[UIButton alloc] init];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [[UIButton alloc] init];
    }
    return _rightButton;
}

- (void)initLeftButton {
    
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton.frame = CGRectMake(0, 0, 60, 44);
    [self.leftButton setTitle:@"< Back" forState:UIControlStateNormal];
    
    [self.leftButton addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    self.navigationItem.leftBarButtonItem = barButton;
}

- (void)initRightButton {
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(0, 0, 60, 44);
    [self.rightButton setTitle:@"分享" forState:UIControlStateNormal];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
    self.navigationItem.rightBarButtonItem = barButton;
}

- (void)popView {
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotifictionBackMainView" object:self userInfo:nil];
}

@end
