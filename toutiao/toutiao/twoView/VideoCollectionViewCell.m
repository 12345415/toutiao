//
//  VideoCollectionViewCell.m
//  toutiao
//
//  Created by ZYN on 2022/4/14.
//

#import "VideoCollectionViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import "VideoPlayer.h"
@implementation VideoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:({
                    self.imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
                    self.imageview;
        })];
        
        //为collectionViewCell添加点击事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Play)];
        [self addGestureRecognizer:tap];
        
        
    }
    return self;
}



- (void)Play {
    [[VideoPlayer Player] playVideoWithUrl:self.video attachView:self.imageview];
    
}

- (void)layoutWithVideo:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    self.imageview.image = [UIImage imageNamed:videoCoverUrl];
    
    self.video = videoUrl;
}


@end
