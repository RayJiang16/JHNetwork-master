//
//  JHResponseModel.h
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHResponseModel : NSObject

/** 请求结果成功 */
@property (nonatomic, assign, getter=isSuccess) BOOL success;
/** 错误码 */
@property (nonatomic, assign) NSInteger ecode;
/** 错误信息 */
@property (nonatomic, strong) NSString *msg;
/** 对象(请求结果成功才有可能有) */
@property (nonatomic, strong) id obj;

/** 数据来自缓存 */
@property (nonatomic, assign, readonly, getter=isCache) BOOL cache;

@end
