//
//  JHHTTPEnum.h
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#ifndef JHHTTPEnum_h
#define JHHTTPEnum_h

/**
 服务器类型 - 多服务器
 
 - JHServerMain: 主服务器
 - JHServerCount: 计算服务器
 */
typedef NS_ENUM(NSUInteger, JHServer) {
    JHServerMain,
    JHServerCount,
};


/**
 请求类型
 
 - JHRequestTypeGet: GET请求
 - JHRequestTypePost: POST请求
 - JHRequestTypePostJson: POST请求，参数以JSON的形式放在Body中
 */
typedef NS_ENUM(NSUInteger, JHRequestType) {
    JHRequestTypeGet,
    JHRequestTypePost,
    JHRequestTypePostJson,
};

/**
 缓存策略

 - JHCacheTypeNone: 不缓存
 - JHCacheTypeCache: 只读缓存，不会请求
 - JHCacheTypeCacheAndRequest: 先读取缓存，再请求，再将请求结果缓存
 - JHCacheTypeRequestAndCache: 不读取缓存，直接请求，再将请求结果缓存
 */
typedef NS_ENUM(NSUInteger, JHCacheType) {
    JHCacheTypeNone,
    JHCacheTypeCache,
    JHCacheTypeCacheAndRequest,
    JHCacheTypeRequestAndCache,
};

#endif /* JHHTTPEnum_h */
