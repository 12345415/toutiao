//
//  PushViewController.h
//  toutiao
//
//  Created by ZYN on 2022/4/14.
//

#import <UIKit/UIKit.h>
@class TableViewCell;
@class DeleteTableViewCell;
NS_ASSUME_NONNULL_BEGIN

@interface PushViewController : UIViewController

//@property (nonatomic, strong) UITableView *tableview;
//@property (nonatomic, strong) NSMutableArray *array;
//@property (nonatomic, strong) TableViewCell *cell;
//
//
//@property(nonatomic,strong) dispatch_block_t block;
//
//- (void)showDeleteView:(dispatch_block_t)block;
//- (void)dismissDeleteView;

@property (nonatomic, strong) DeleteTableViewCell *del;





@end

NS_ASSUME_NONNULL_END
