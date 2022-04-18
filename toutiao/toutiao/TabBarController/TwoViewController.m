//
//  TwoViewController.m
//  toutiao
//
//  Created by ZYN on 2022/4/14.
//

#import "TwoViewController.h"
#import "VideoCollectionViewCell.h"

@interface TwoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initCollection];
}



- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        //layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(self.view.bounds.size.width, 200);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 91, self.view.bounds.size.width , 761-91) collectionViewLayout:layout];
        
    }
    return _collectionView;
}

- (void)initCollection {
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[VideoCollectionViewCell class] forCellWithReuseIdentifier:@"TwoCollectionViewCell"];
    
    [self.view addSubview:self.collectionView];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    VideoCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"TwoCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    [cell layoutWithVideo:@"111" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}


@end
