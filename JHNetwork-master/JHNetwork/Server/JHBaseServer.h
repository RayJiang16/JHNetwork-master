//
//  JHBaseServer.h
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHBaseServer : NSObject

/** 根路径 eg.https://www.baidu.com/ */
@property (nonatomic, strong, readonly) NSString *baseURL;
/** 公共Header */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> *header;

@end
