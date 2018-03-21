//
//  JHBaseEngine.m
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import "JHBaseEngine.h"
#import "JHResponseGenerator.h"
#import "JHRequestGenerator.h"
#import "JHRequestModel.h"
#import "JHAPIClient.h"
#import "JHCache.h"

@interface JHBaseEngine ()
@property (nonatomic, assign) NSUInteger requestID;

@end

@implementation JHBaseEngine

+ (instancetype)engineWithRequestModel:(JHRequestModel *)model handler:(responseHandler)handler {
    JHBaseEngine *engine = [JHBaseEngine new];
    NSURLRequest *request = [JHRequestGenerator requestWithModel:model];
    
    // 读取缓存
    if (model.shouldReadCache) {
        JHResponseModel *cache = [self p_loadCacheWithModel:model url:request.URL.absoluteString];
        !cache ?: handler(cache);
        if (cache && model.cacheType == JHCacheTypeCache) {
            return nil;
        }
    }
    
    // 开始请求
    engine.requestID = [JHAPIClient requestWithRequest:request handler:^(id obj, NSError *error) {
        if (!handler) {
            return;
        }
        
        if (error) {
            handler([JHResponseGenerator failModel]);
        } else if (!error && obj) {
            // 可以自定义解析规则
            JHResponseModel *response = [JHResponseGenerator modelWithDict:obj cls:model.responseClass];
            handler(response);
        }
        
        // 写入缓存
        if (model.shouldWriteCache) {
            [JHCache setCache:obj url:request.URL.absoluteString params:model.param time:model.cacheTime];
        }
    }];
    
    return engine;
}

- (void)cancelRequest {
    [JHAPIClient cancelRequestWithRequestID:self.requestID];
}

#pragma mark - Private
/** 读取缓存 */
+ (JHResponseModel *)p_loadCacheWithModel:(JHRequestModel *)model url:(NSString *)url {
    id cache = [JHCache cacheForUrl:url params:model.param];
    if (!cache) {
        return nil;
    }
    // 可以自定义解析规则
    JHResponseModel *response = [JHResponseGenerator cacheModelWithDict:cache cls:model.responseClass];
    return response;
}

@end
