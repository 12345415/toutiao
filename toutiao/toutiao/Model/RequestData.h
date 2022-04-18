//
//  RequestData.h
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import <Foundation/Foundation.h>
#import "NSObject+YYModel.h"
@class ListData;

typedef void(^RequestTitleData)(NSMutableArray<ListData*> * _Nullable array);

NS_ASSUME_NONNULL_BEGIN

@interface RequestData : NSObject

- (void)requestdata:(RequestTitleData)block;

@end

NS_ASSUME_NONNULL_END
