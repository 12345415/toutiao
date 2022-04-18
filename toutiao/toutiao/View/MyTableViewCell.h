//
//  MyTableViewCell.h
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import <UIKit/UIKit.h>
@class ListItem;
NS_ASSUME_NONNULL_BEGIN

@protocol deleteCell <NSObject>

-(void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)button;

@end

@interface MyTableViewCell : UITableViewCell

@property(nonatomic,strong) UILabel *message;
@property(nonatomic,strong) UILabel *source;
@property(nonatomic,strong) UILabel *command;
@property(nonatomic,strong,readwrite) UIImageView *imageview;
@property(nonatomic,strong) UIButton *button;
@property(nonatomic,strong) UITextField *textfield;

@property(nonatomic,weak,readwrite) id<deleteCell> delegate;

- (void)layoutTableViewCell:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
