//
//  OneViewController.m
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import "OneViewController.h"
#import "MyCollectionViewCell.h"
#import "TwoCollectionViewCell.h"
#import "RequestData.h"
#import "YYModelList.h"
#import "ViewController.h"
#import "NewsContentView.h"

@interface OneViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation OneViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    __weak typeof(self) wself = self;
    [self.data requestdata:^(NSMutableArray<ListData *> * _Nullable array) {
            wself.titleArr = array;
            wself.collectionArr = array;
            [wself.titleCollectionView reloadData];
            [wself.collectView reloadData];
    }];
    
    //监听点击搜索条
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushSearchView) name:@"kNotifictionSearchBar" object:nil];
    //监听从搜索界面返回首页
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backMainView) name:@"kNotifictionBackMainView" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushNewsContentView) name:@"kNotifictionNewsContent" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainViewSearch) name:@"kNotifictionBackMainView" object:nil];
    
    [self initAll];

}

- (void)initAll {
    //[self initScollerView];
    [self initCollectionView];
    [self inittitleCollectionView];
    [self initSearch];
}



#pragma mark ---getter---

- (ListData *)list {
    if (!_list) {
        _list = [[ListData alloc] init];
    }
    return _list;
}

//新闻列表视图
- (UICollectionView *)collectView {
    if (!_collectView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height - 91-121);
        _collectView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 121, self.view.bounds.size.width , self.view.bounds.size.height - 91-121) collectionViewLayout:layout];
        [_collectView setPagingEnabled:YES];
    }
    return _collectView;
}

- (SearchBar *)search {
    if (!_search) {
        _search = [[SearchBar alloc] init];
    }
    return _search;
}

//新闻列表分类视图
- (UICollectionView *)titleCollectionView {
    if (!_titleCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 5;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _titleCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 47+44, UIScreen.mainScreen.bounds.size.width, 30) collectionViewLayout:layout];
    }
    return _titleCollectionView;
}


- (NSMutableArray *)titleArr {
    if (!_titleArr) {
        _titleArr = [[NSMutableArray alloc] init];
    }
    return _titleArr;
}

- (NSMutableArray *)collectionArr {
    if (!_collectionArr) {
        _collectionArr = [[NSMutableArray alloc] init];
    }
    return _collectionArr;
}


- (RequestData *)data {
    if (!_data) {
        _data = [[RequestData alloc] init];
    }
    return _data;
}

- (MyCollectionViewCell *)onecell {
    if (!_onecell) {
        _onecell = [[MyCollectionViewCell alloc] init];
    }
    return _onecell;
}

#pragma mark ---init---
//初始化新闻列表分类视图
- (void)inittitleCollectionView {
    self.titleCollectionView.backgroundColor = [UIColor whiteColor];
    self.titleCollectionView.delegate = self;
    self.titleCollectionView.dataSource = self;
    self.titleCollectionView.showsHorizontalScrollIndicator = NO;
    [self.titleCollectionView registerClass:[TwoCollectionViewCell class] forCellWithReuseIdentifier:@"TwoCollectionViewCellIdentifire"];
    
    [self.view addSubview:self.titleCollectionView];
   
}
//初始化搜索条
- (void)initSearch {
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.search.frame = CGRectMake(0, 0, 100, self.navigationController.navigationBar.bounds.size.height);
    
    
    [self.navigationController.navigationBar addSubview:self.search];
}

//初始化新闻列表视图
- (void)initCollectionView {
    self.collectView.backgroundColor = [UIColor whiteColor];
    self.collectView.delegate = self;
    self.collectView.dataSource = self;
    self.collectView.showsHorizontalScrollIndicator = NO;
    //注册cell，实现cell的复用
    [self.collectView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"OneCollectionViewCellIdentifier"];
    [self.view addSubview:self.collectView];
}

//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return  1;
}

//定义展示的cell个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titleArr.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    if (self.collectView == collectionView) {
        self.onecell = [self.collectView dequeueReusableCellWithReuseIdentifier:@"OneCollectionViewCellIdentifier" forIndexPath:indexPath];
        self.onecell.backgroundColor = [UIColor whiteColor];
        [self.onecell config:[self.titleArr objectAtIndex:indexPath.item]];
        return self.onecell;
    }
    
    TwoCollectionViewCell *twocell = [self.titleCollectionView dequeueReusableCellWithReuseIdentifier:@"TwoCollectionViewCellIdentifire" forIndexPath:indexPath];
    twocell.backgroundColor = [UIColor whiteColor];
    [twocell layoutTitleCollectionView:[self.titleArr objectAtIndex:indexPath.item]];
    return twocell;
    
}


//cell
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.collectView) {
        return CGSizeMake(UIScreen.mainScreen.bounds.size.width , UIScreen.mainScreen.bounds.size.height - 91);
    }
    return CGSizeMake(50, self.titleCollectionView.frame.size.height);
    
}

//点击新闻列表分类代理
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.titleCollectionView == collectionView) {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        NSIndexPath *viewIndexPath  = [NSIndexPath indexPathForItem:indexPath.item inSection:0];
        [self.collectView scrollToItemAtIndexPath:viewIndexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
        [self.collectView reloadData];
    }
}

//实现当新闻列表滚动时，新闻分类条也会随之滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.collectView]) {
        CGFloat x = scrollView.contentOffset.x;
        CGFloat i = x / UIScreen.mainScreen.bounds.size.width;
        [self.titleCollectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    }
}


- (void)pushSearchView {
    
    ViewController *vc = [[ViewController alloc] init];
    
    self.search.textField.frame = CGRectMake(0, 0, 260, 44);
    self.search.frame = CGRectMake(60, 0, 260, 44);
    [self.navigationController pushViewController:vc animated:YES];
    self.navigationItem.hidesBackButton = YES;
}


- (void)backMainView {
    self.search.frame = CGRectMake(0, 0, 370, 44);
    self.search.textField.frame = CGRectMake(10, 0, 370, 44);
    
}

- (void)pushNewsContentView {
    NewsContentView *newsContent = [[NewsContentView alloc] init];
    
    [self.navigationController pushViewController:newsContent animated:YES];
    [self.search removeFromSuperview];
    
}

- (void)mainViewSearch {
    [self initSearch];
}

@end


