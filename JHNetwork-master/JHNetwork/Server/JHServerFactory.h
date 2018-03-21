//
//  JHServerFactory.h
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHHTTPEnum.h"

@class JHBaseServer;

@interface JHServerFactory : NSObject

/**
 单例方法

 @return 实例对象
 */
+ (instancetype)sharedInstance;

/**
 根据服务器枚举生成实例化对象
 
 @param type 服务器枚举
 @return 服务器实例化对象
 */
- (JHBaseServer *)serverWithType:(JHServer)type;

@end
