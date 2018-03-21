//
//  JHResponseGenerator.h
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JHResponseModel;

@interface JHResponseGenerator : NSObject

/**
 获取请求失败的响应对象

 @return 请求失败的响应对象
 */
+ (JHResponseModel *)failModel;

/**
 创建响应对象

 @param dict JSON字典
 @param cls 响应对象中的对象 - 可以为nil
 @return 响应对象
 */
+ (JHResponseModel *)modelWithDict:(NSDictionary *)dict cls:(Class)cls;

+ (JHResponseModel *)cacheModelWithDict:(NSDictionary *)dict cls:(Class)cls;

@end
