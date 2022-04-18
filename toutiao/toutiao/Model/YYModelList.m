//
//  YYModelList.m
//  toutiao
//
//  Created by ZYN on 2022/4/13.
//

#import "YYModelList.h"
#import "ListData.h"
@implementation YYModelList

- (NSString *)reason {
    if (!_reason) {
        _reason = [[NSString alloc] init];
    }
    return _reason;
}

- (NSMutableArray *)data {
    if (!_data) {
        _data = [[NSMutableArray alloc] init];
    }
    return _data;
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"data": [ListData class]
    };
}

@end
