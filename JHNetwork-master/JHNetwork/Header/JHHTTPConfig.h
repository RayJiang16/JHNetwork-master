//
//  JHHTTPConfig.h
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#ifndef JHHTTPConfig_h
#define JHHTTPConfig_h

/** 环境配置 Release优先级最高，其他环境优先级从上到下 */
#ifdef DEBUG
//#define JH_BUILD_FOR_DEVELOP
//#define JH_BUILD_FOR_TEST
#define JH_BUILD_FOR_RELEASE
#else
#define JH_BUILD_FOR_RELEASE
#endif

#ifdef DEBUG
/** 打印请求所用时间 */
#define JH_SHOW_API_TIME
/** 打印请求结果 */
#define JH_SHOW_API_RESULT
#endif

/** 请求超时时间 */
static const NSTimeInterval JHRequestTimeout = 5;

#endif /* JHHTTPConfig_h */
