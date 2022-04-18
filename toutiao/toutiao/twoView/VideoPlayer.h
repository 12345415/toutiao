//
//  VideoPlayer.h
//  toutiao
//
//  Created by ZYN on 2022/4/14.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoPlayer : NSObject

@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;


//单例，一次只能有一个视频进行播放
+ (VideoPlayer *)Player;

- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView;


@end

NS_ASSUME_NONNULL_END
