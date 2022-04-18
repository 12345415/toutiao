//
//  OneViewController.h
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//
#import <UIKit/UIKit.h>
#import "RequestData.h"
#import "MyCollectionViewCell.h"
#import "SearchBar.h"
#import "ListData.h"


NS_ASSUME_NONNULL_BEGIN
@class ViewController;
@interface OneViewController : UIViewController

@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) UICollectionView *collectView;
@property(nonatomic,strong) UICollectionView *titleCollectionView;
@property(nonatomic,strong) NSMutableArray *array;
@property(nonatomic,strong) NSMutableArray *titleArr;
@property(nonatomic,strong) NSMutableArray *collectionArr;
@property(nonatomic,strong) RequestData *data;
@property(nonatomic,strong) MyCollectionViewCell *onecell;
@property(nonatomic,strong) SearchBar *search;

@property (nonatomic, strong) ListData *list;

@property (nonatomic, strong) ViewController *viewCon;

@end

NS_ASSUME_NONNULL_END
