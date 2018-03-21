//
//  JHCache.h
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHCache : NSObject

/**
 设置缓存

 @param data 缓存数据
 @param url 缓存的url，作为key用于读取缓存
 @param params 请求参数
 @param time 缓存时间 - 默认缓存时间：10分钟 - 单位：秒
 */
+ (void)setCache:(id)data url:(NSString *)url params:(id)params time:(NSUInteger)time;

/**
 读取缓存

 @param url 缓存的url
 @param params 请求参数
 @return 缓存数据
 */
+ (id)cacheForUrl:(NSString *)url params:(id)params;

/**
 获取缓存的总大小

 @return 缓存的总大小
 */
+ (NSInteger)getAllCacheSize;

/**
 删除所有缓存
 */
+ (void)removeAllCache;

@end
