//
//  JHRequestModel.h
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHHTTPEnum.h"

@interface JHRequestModel : NSObject

/** 服务器 */
@property (nonatomic, assign) JHServer server;
/** API请求地址 */
@property (nonatomic, strong) NSString *path;
/** 请求头 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> *header;
/** 请求参数 */
@property (nonatomic, strong) NSDictionary<NSString *, NSObject *> *param;
/** 请求类型 */
@property (nonatomic, assign) JHRequestType requestType;
/** 返回对象的类型 */
@property (nonatomic, assign) Class responseClass;
/** 缓存类型 */
@property (nonatomic, assign) JHCacheType cacheType;
/** 缓存时间 - 单位：分钟 */
@property (nonatomic, assign) NSUInteger cacheTime;

/** HTTP请求类型 */
@property (nonatomic, strong, readonly) NSString *HTTPMethod;
/** 需要读取缓存 */
@property (nonatomic, assign, readonly, getter=shouldReadCache) BOOL readCache;
/** 需要写入缓存 */
@property (nonatomic, assign, readonly, getter=shouldWriteCache) BOOL writeCache;


/** 无缓存工厂方法 */
+ (instancetype)modelWithServer:(JHServer)server
                           path:(NSString *)path
                         header:(NSDictionary *)header
                          param:(NSDictionary *)param
                    requestType:(JHRequestType)requestType
                  responseClass:(Class)responseClass;

/** 缓存工厂方法 */
+ (instancetype)modelWithServer:(JHServer)server
                           path:(NSString *)path
                         header:(NSDictionary *)header
                          param:(NSDictionary *)param
                    requestType:(JHRequestType)requestType
                  responseClass:(Class)responseClass
                      cacheType:(JHCacheType)cacheType
                      cacheTime:(NSUInteger)cacheTime;


@end
