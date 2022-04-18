//
//  SearchBar.h
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchBar : UIView

@property(nonatomic,strong) UITextField *textField;

@property (nonatomic, strong) dispatch_block_t block;


@end

NS_ASSUME_NONNULL_END
