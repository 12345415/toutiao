//
//  YYModelList.h
//  toutiao
//
//  Created by ZYN on 2022/4/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYModelList : NSObject

@property (nonatomic,strong,readwrite) NSString *reason;
@property (nonatomic,strong,readwrite) NSMutableArray *data;


@end

NS_ASSUME_NONNULL_END
