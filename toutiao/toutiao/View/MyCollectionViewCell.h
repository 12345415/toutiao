//
//  MyCollectionViewCell.h
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import <UIKit/UIKit.h>

@class ListData;


NS_ASSUME_NONNULL_BEGIN


@interface MyCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *array;

- (void)config:(ListData *)list;


@end

NS_ASSUME_NONNULL_END

