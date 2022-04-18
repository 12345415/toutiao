//
//  RequestData.m
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import "RequestData.h"
#import "ListData.h"
#import "YYModelList.h"


@interface RequestData ()<NSURLSessionDelegate>

@end

@implementation RequestData

- (void)requestdata:(RequestTitleData)block {
    NSString *urlString = @"https://www.baidu.com/content-search.xml";
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    //NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *datatask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            //方法一：使用YYModel处理数据，将数据模块化
            YYModelList *model = [YYModelList yy_modelWithDictionary:dict];
//            方法二：将数据模块化
//            NSMutableArray *listArr = @[].mutableCopy;
//
//            for (NSDictionary *info in dic) {
//                ListData *list = [[ListData alloc] init];
//                [list configWithCollectionViewCell:info];
//                NSLog(@"");
//                [listArr addObject:list];
//            }

            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (block) {
                    block(model.data);
                    
                }
            });
        }
        
        NSLog(@"%@",error);
        NSLog(@"");
    }];
    
    [datatask resume];
    
}

#pragma mark ---NSURLSessionDelegate---
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler {
    NSURLSessionAuthChallengeDisposition disposition = NSURLSessionAuthChallengePerformDefaultHandling;
    __block NSURLCredential *credential = nil;

    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust] ) {
        credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];

        if (credential) {
            disposition = NSURLSessionAuthChallengeUseCredential;
        } else {
            disposition = NSURLSessionAuthChallengePerformDefaultHandling;
        }
    } else {
        disposition = NSURLSessionAuthChallengePerformDefaultHandling;
    }

    if (completionHandler) {
        completionHandler(disposition,credential);
    }
}

@end

