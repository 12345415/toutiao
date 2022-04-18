//
//  VideoCollectionViewCell.h
//  toutiao
//
//  Created by ZYN on 2022/4/14.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageview;
@property (nonatomic, strong) NSString *video;
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;

- (void)layoutWithVideo:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
