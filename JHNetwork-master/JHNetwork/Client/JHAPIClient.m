//
//  JHAPIClient.m
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import "JHAPIClient.h"
#import "JHHTTPConfig.h"
#import <AFNetworking.h>

@interface JHAPIClient ()
@property (nonatomic, strong) AFURLSessionManager *sessionManager;
@property (nonatomic, strong) NSMutableDictionary *taskDict;

@end

@implementation JHAPIClient

+ (NSUInteger)requestWithRequest:(NSURLRequest *)request handler:(void (^)(id, NSError *))handler {
    JHAPIClient *client = [self p_sharedInstance];
#ifdef JH_SHOW_API_TIME
    NSTimeInterval time = [[NSDate new] timeIntervalSince1970];
#endif
    
    __block NSURLSessionDataTask *task = nil;
    task = [client.sessionManager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
#ifdef JH_SHOW_API_TIME
        NSLog(@"API: Use %.2lfs to request %@", [[NSDate new] timeIntervalSince1970] - time, [request.URL path]);
#endif
#ifdef JH_SHOW_API_RESULT
        NSLog(@"API: %@", responseObject ? responseObject : error);
#endif
        [client.taskDict removeObjectForKey:@(task.hash)];
        !handler ?: handler(responseObject, error);
    }];
    
    [task resume];
    if (task.hash > 0) {
        [client.taskDict setObject:task forKey:@(task.hash)];
    }
    
    return task.hash;
}

+ (void)cancelRequestWithRequestID:(NSUInteger)requestID {
    @synchronized(self) {
        JHAPIClient *client = [self p_sharedInstance];
        NSURLSessionDataTask *task = client.taskDict[@(requestID)];
        [task cancel];
        [client.taskDict removeObjectForKey:@(requestID)];
    }
}

#pragma mark - Private
+ (instancetype)p_sharedInstance {
    static JHAPIClient *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [JHAPIClient new];
    });
    return instance;
}

#pragma mark - Lazy loading
- (AFURLSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return _sessionManager;
}

- (NSMutableDictionary *)taskDict {
    if (!_taskDict) {
        _taskDict = @{}.mutableCopy;
    }
    return _taskDict;
}

@end
