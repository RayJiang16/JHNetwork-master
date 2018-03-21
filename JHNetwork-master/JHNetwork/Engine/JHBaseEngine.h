//
//  JHBaseEngine.h
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHResponseModel.h"

@class JHRequestModel;

typedef void (^responseHandler) (JHResponseModel *response);

@interface JHBaseEngine : NSObject

/**
 请求数据

 @param model 请求对象
 @param handler 请求结果回调，若使用了缓存策略会回调两次
 @return 实例对象
 */
+ (instancetype)engineWithRequestModel:(JHRequestModel *)model handler:(responseHandler)handler;

/**
 取消请求
 */
- (void)cancelRequest;

@end
