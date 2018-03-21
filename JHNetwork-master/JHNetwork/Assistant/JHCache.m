//
//  JHCache.m
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import "JHCache.h"
#import <YYCache.h>

@interface JHCache ()
@property (nonatomic, strong) YYCache *cache;
@property (nonatomic, strong) YYCache *expiredCache;

@end

@implementation JHCache

/** 默认缓存时间十分钟 */
static const NSUInteger defaultCacheTime = 600;

+ (void)setCache:(id)data url:(NSString *)url params:(id)params time:(NSUInteger)time {
    JHCache *obj = [JHCache p_sharedInstance];
    NSString *cacheKey = [self p_cacheKeyWithUrl:url params:params];
    [obj.cache setObject:data forKey:cacheKey withBlock:nil];
    [obj.expiredCache setObject:[self p_addTime:time] forKey:cacheKey withBlock:nil];
}

+ (id)cacheForUrl:(NSString *)url params:(id)params {
    JHCache *obj = [JHCache p_sharedInstance];
    NSString *cacheKey = [self p_cacheKeyWithUrl:url params:params];
    if ([self p_cacheAlive:(NSNumber *)[obj.expiredCache objectForKey:cacheKey]]) {
        return [obj.cache objectForKey:cacheKey];
    }
    return nil;
}

+ (NSInteger)getAllCacheSize {
    JHCache *obj = [JHCache p_sharedInstance];
    return [obj.cache.diskCache totalCost];
}

+ (void)removeAllCache {
    JHCache *obj = [JHCache p_sharedInstance];
    [obj.cache.diskCache removeAllObjects];
    [obj.cache.memoryCache removeAllObjects];
}

#pragma mark - Private
+ (instancetype)p_sharedInstance {
    static JHCache *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [JHCache new];
        instance.cache = [YYCache cacheWithName:@"JHCache"];
        instance.expiredCache = [YYCache cacheWithName:@"JHExpiredCache"];
    });
    return instance;
}

+ (NSString *)p_cacheKeyWithUrl:(NSString *)url params:(NSDictionary *)params {
    if(!params || params.count == 0) {
        return url;
    };
    NSData *stringData = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    NSString *paraString = [[NSString alloc] initWithData:stringData encoding:NSUTF8StringEncoding];
    return [NSString stringWithFormat:@"%@%@" ,url, paraString];
}

+ (NSNumber *)p_addTime:(NSUInteger)time {
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    if (time == 0) {
        time = defaultCacheTime;
    }
    return @(timestamp + (time));
}

+ (BOOL)p_cacheAlive:(NSNumber *)time {
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    return timestamp < [time doubleValue];
}

@end
