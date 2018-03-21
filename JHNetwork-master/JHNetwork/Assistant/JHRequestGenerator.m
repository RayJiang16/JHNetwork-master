//
//  JHRequestGenerator.m
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import "JHRequestGenerator.h"
#import "JHServerFactory.h"
#import "JHRequestModel.h"
#import "JHBaseServer.h"
#import "JHHTTPConfig.h"

@implementation JHRequestGenerator

+ (NSURLRequest *)requestWithModel:(JHRequestModel *)model {
    JHBaseServer *server = [JHServerFactory serverWithType:model.server];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", server.baseURL, model.path]];
    NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:url];
    
    // 配置
    mutableRequest.HTTPMethod      = model.HTTPMethod;
    mutableRequest.timeoutInterval = JHRequestTimeout;
    
    // 设置公共Header
    [server.header enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        [mutableRequest setValue:obj forHTTPHeaderField:key];
    }];
    
    // 设置自定义Header
    [model.header enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        [mutableRequest setValue:obj forHTTPHeaderField:key];
    }];
    
    // 设置参数
    if (!model.param) {
        return [mutableRequest copy];
    }
    
    NSString *query = [self p_paramStringWithDict:model.param];
    if (model.requestType == JHRequestTypeGet) {
        mutableRequest.URL = [NSURL URLWithString:[[mutableRequest.URL absoluteString] stringByAppendingFormat:@"?%@", query]];
    } else if (model.requestType == JHRequestTypePost) {
        [mutableRequest setHTTPBody:[query dataUsingEncoding:NSUTF8StringEncoding]];
    } else if (model.requestType == JHRequestTypePostJson) {
        [mutableRequest setHTTPBody:[self p_DictToData:model.param]];
    }
    
    return [mutableRequest copy];
}

#pragma mark - Private
/** 拼接参数字符串 */
+ (NSString *)p_paramStringWithDict:(NSDictionary *)dict {
    NSMutableArray<NSString *> *mutableArray = @[].mutableCopy;
    [dict enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSObject *obj, BOOL * _Nonnull stop) {
        [mutableArray addObject:[NSString stringWithFormat:@"%@=%@", key, obj]];
    }];
    return [mutableArray componentsJoinedByString:@"&"];
}

/** NSDictionary转Data */
+ (NSData *)p_DictToData:(NSDictionary *)dict {
    if (dict) {
        return [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    }
    return nil;
}

@end
