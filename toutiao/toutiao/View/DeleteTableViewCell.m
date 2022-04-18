//
//  DeleteTableViewCell.m
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import "DeleteTableViewCell.h"
#import "TableViewCell.h"
@interface DeleteTableViewCell()

@end

@implementation DeleteTableViewCell

- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:self.bounds];
    }
    return _backView;
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
    }
    return _button;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
       
        self.backView.backgroundColor = [UIColor lightGrayColor];
        self.backView.alpha = 0.4;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView)];
        [self.backView addGestureRecognizer:tap];
        [self addSubview:self.backView];
        
        
        self.button.backgroundColor = [UIColor lightGrayColor];
        [self.button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        [self.button setTitle:@"不感兴趣" forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:self.button];
                
        self.clipsToBounds = YES;
        
        
    }
    
    return self;
}

//删除视图
- (void)showDeleteView:(dispatch_block_t)block {
   
    _block = [block copy];
    
    [[UIApplication sharedApplication].windows.firstObject addSubview:self];
    self.backView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    self.button.frame = CGRectMake((self.bounds.size.width - 100) / 2 , (self.bounds.size.height - 50) / 2, 100, 50);
   
}

- (void)dismissDeleteView {
    [self removeFromSuperview];
}
//删除按钮点击事件
- (void)clickButton {
    
    if (_block) {
        _block();
    }
    
    [self removeFromSuperview];
}



@end

