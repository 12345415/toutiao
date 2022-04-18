//
//  SearchBar.m
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import "SearchBar.h"

@interface SearchBar() <UITextFieldDelegate>

@end

@implementation SearchBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
                    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, 370, 44)];
                    self.textField.backgroundColor = [UIColor whiteColor];
                    self.textField.delegate = self;
                    self.textField.clearButtonMode = UITextFieldViewModeAlways;
            self.textField.placeholder = @"搜索";
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTextField)];
            [self.textField addGestureRecognizer:tap];
                    self.textField;
        })];
    }
    return self;
}


#pragma mark ---UITextFieldDelegate---
- (void)textFieldDidBeginEditing:(UITextField *)textField{

}

- (void)textFieldDidEndEditing:(UITextField *)textField{
  
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    //常用业务逻辑 - 字数判断 可以在此函数中实现
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

#pragma mark ---textField点击事件---
- (void)clickTextField {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotifictionSearchBar" object:self userInfo:nil];
}


@end
