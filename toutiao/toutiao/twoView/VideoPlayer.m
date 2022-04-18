//
//  VideoPlayer.m
//  toutiao
//
//  Created by ZYN on 2022/4/14.
//

#import "VideoPlayer.h"

@implementation VideoPlayer

//单例，一次只有一个视频播放
+ (VideoPlayer *)Player {
    static VideoPlayer *player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[VideoPlayer alloc] init];
    });
    return player;
}

- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView {
    
    [self stopPlay];
    
    NSURL *videoURL = [NSURL URLWithString:videoUrl];
    //视频资源属性
    AVAsset *asset = [AVAsset assetWithURL:videoURL];
    self.playerItem = [AVPlayerItem playerItemWithAsset:asset];
    [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.playerItem addObserver:self forKeyPath:@"process" options:NSKeyValueObservingOptionNew context:nil];
    
    //获取视频时长
    CMTime duration = self.playerItem.duration;
    CGFloat videoDuration = CMTimeGetSeconds(duration);
    
    self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
            NSLog(@"播放进度: %@",@(CMTimeGetSeconds(time)));
    }];
    
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer:self.playerLayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlePlay) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    NSLog(@"");
}

- (void)stopPlay {
    [self.playerLayer removeFromSuperlayer];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.playerItem removeObserver:self forKeyPath:@"status"];
    [self.playerItem removeObserver:self forKeyPath:@"process"];
}


- (void)handlePlay {
   
    [self.player seekToTime:CMTimeMake(0, 1)];
    [self.player play];
}


//kvo监听
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
            [self.player play];
        }else {
            NSLog(@"");
        }
        
    }else if([keyPath isEqualToString:@"process"]) {
        NSLog(@"缓冲: %@",[change objectForKey:NSKeyValueChangeNewKey]);
    }
}


@end
