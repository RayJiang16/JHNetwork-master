//
//  JHAPIClient.h
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHAPIClient : NSObject

/**
 用RequestGenerator解析RequestModel再发送网络请求
 
 @param request request对象
 @param handler 回调
 @return 请求ID - 用于取消请求
 */
+ (NSUInteger)requestWithRequest:(NSURLRequest *)request handler:(void (^)(id obj, NSError *error))handler;

/**
 取消正在执行的网络请求
 
 @param requestID 请求ID
 */
+ (void)cancelRequestWithRequestID:(NSUInteger)requestID;

@end
