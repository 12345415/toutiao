//
//  ViewController.m
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import "ViewController.h"
#import "OneViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"kNotifiction" object:self.navigationItem userInfo:nil];
    
    [self initLeftButton];
    [self initTextField];
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

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
    }
    return _textField;
}

- (void)initLeftButton {
    
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton.frame = CGRectMake(0, 0, 60, 44);
    [self.leftButton setTitle:@"<" forState:UIControlStateNormal];
    
    [self.leftButton addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    self.navigationItem.leftBarButtonItem = barButton;
}

- (void)initRightButton {
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(0, 0, 60, 44);
    [self.rightButton setTitle:@"搜索" forState:UIControlStateNormal];
    [self.rightButton addTarget:self action:@selector(searchMessage) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
    self.navigationItem.rightBarButtonItem = barButton;
    
}

- (void)initTextField {
    
    self.textField.frame = CGRectMake(60, 0, 260, 44);
    self.textField.placeholder = @"搜索";
   
    self.textField.backgroundColor = [UIColor whiteColor];
    self.textField.delegate = self;
    [self.navigationController.navigationBar addSubview:self.textField];
}

- (void)popView {
    [self.textField removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotifictionBackMainView" object:self userInfo:nil];
 
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"");
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    NSLog(@"");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSLog(@"");
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSLog(@"");
    //点击键盘return收起键盘
    return [self.textField resignFirstResponder];
}

//搜索按钮点击事件
- (void)searchMessage {
    
}

@end
