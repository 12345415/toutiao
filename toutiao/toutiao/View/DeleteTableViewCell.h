//
//  DeleteTableViewCell.h
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import <UIKit/UIKit.h>
@class TableViewCell;

NS_ASSUME_NONNULL_BEGIN

@interface DeleteTableViewCell : UIView

@property(nonatomic,strong) UIView *backView;
@property(nonatomic,strong) UIButton *button;
//无参数无返回值的block
@property(nonatomic,strong) dispatch_block_t block;

//展示删除视图方法
- (void)showDeleteView:(dispatch_block_t)block;
- (void)dismissDeleteView;



@end

NS_ASSUME_NONNULL_END
