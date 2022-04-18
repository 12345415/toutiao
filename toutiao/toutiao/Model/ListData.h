//
//  ListData.h
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import <Foundation/Foundation.h>

@class YYModelList;
NS_ASSUME_NONNULL_BEGIN

@interface ListData : NSObject

@property (nonatomic,strong,readwrite) NSString *title;
@property (nonatomic,strong,readwrite) NSMutableArray *data;

//@property (nonatomic,strong,readwrite) NSString *title2;
//@property (nonatomic,strong,readwrite) NSString *data2;
//@property (nonatomic,strong,readwrite) NSString *authorname;
//@property (nonatomic,strong,readwrite) NSString *url;
//@property (nonatomic,strong,readwrite) NSString *category;
//@property (nonatomic,strong,readwrite) NSString *comments;


- (void)configWithCollectionViewCell:(NSDictionary *)dict;

//- (void)configWithTableViewCell:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END

