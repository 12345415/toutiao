//
//  TwoCollectionViewCell.h
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import <UIKit/UIKit.h>
@class ListData;
NS_ASSUME_NONNULL_BEGIN

@interface TwoCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong) UILabel *label;

- (void)layoutTitleCollectionView:(ListData *)list;

@end

NS_ASSUME_NONNULL_END
