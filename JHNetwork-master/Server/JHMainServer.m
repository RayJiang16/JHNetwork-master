//
//  JHMainServer.m
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import "JHMainServer.h"
#import "JHHTTPConfig.h"

@implementation JHMainServer

- (NSString *)baseURL {
#ifdef JH_BUILD_FOR_RELEASE
    return @"http://www.baidu.com/";
#elif JH_BUILD_FOR_DEVELOP
    return @"http://www.baidu.com/";
#elif JH_BUILD_FOR_TEST
    return @"http://www.baidu.com/";
#endif
}

- (NSDictionary<NSString *,NSString *> *)header {
    return @{@"Content-Type":@"application/json",
             @"platform"    :@"iOS"};
}

@end
