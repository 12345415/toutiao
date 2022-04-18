//
//  ListData.m
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import "ListData.h"
#import "YYModelList.h"
@implementation ListData

- (NSString *)title {
    if (!_title) {
        _title = [[NSString alloc] init];
    }
    return _title;
}

- (NSMutableArray *)data {
    if (!_data) {
        _data = [[NSMutableArray alloc] init];
    }
    return _data;
}



- (void)configWithCollectionViewCell:(NSDictionary *)dict {
    self.title = [dict objectForKey:@"title"];
    self.data = [dict objectForKey:@"data"];
}



@end

