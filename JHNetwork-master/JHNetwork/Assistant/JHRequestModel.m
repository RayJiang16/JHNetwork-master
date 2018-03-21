//
//  JHRequestModel.m
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import "JHRequestModel.h"

@implementation JHRequestModel

+ (instancetype)modelWithServer:(JHServer)server path:(NSString *)path header:(NSDictionary *)header param:(NSDictionary *)param requestType:(JHRequestType)requestType responseClass:(Class)responseClass {
    return [self modelWithServer:server path:path header:header param:param requestType:requestType responseClass:responseClass cacheType:JHCacheTypeNone cacheTime:0];
}

+ (instancetype)modelWithServer:(JHServer)server path:(NSString *)path header:(NSDictionary *)header param:(NSDictionary *)param requestType:(JHRequestType)requestType responseClass:(Class)responseClass cacheType:(JHCacheType)cacheType cacheTime:(NSUInteger)cacheTime {
    JHRequestModel *model = [JHRequestModel new];
    model.server        = server;
    model.path          = path;
    model.header        = header;
    model.param         = param;
    model.requestType   = requestType;
    model.responseClass = responseClass;
    model.cacheType     = cacheType;
    model.cacheTime     = cacheTime;
    return model;
}

#pragma mark - Getter
- (NSString *)HTTPMethod {
    switch (self.requestType) {
        case JHRequestTypeGet: return @"GET";
        case JHRequestTypePost:return @"POST";
        case JHRequestTypePostJson:return @"POST";
    }
}

- (BOOL)shouldReadCache {
    return self.cacheType == JHCacheTypeCache || self.cacheType == JHCacheTypeCacheAndRequest;
}

- (BOOL)shouldWriteCache {
    return self.cacheType == JHCacheTypeCache || self.cacheType == JHCacheTypeCacheAndRequest || self.cacheType == JHCacheTypeRequestAndCache;
}

#pragma mark - Setter
- (NSDictionary<NSString *, NSObject *> *)param {
    if (!_param) {
        return @{};
    }
    return _param;
}

- (NSDictionary<NSString *, NSString *> *)header {
    if (!_header) {
        return @{};
    }
    return _header;
}

@end
