//
//  JHServerFactory.m
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import "JHServerFactory.h"
#import "JHBaseServer.h"

@interface JHServerFactory ()
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, JHBaseServer *> *serverStorage;

@end

@implementation JHServerFactory

+ (JHBaseServer *)serverWithType:(JHServer)type {
    JHServerFactory *factory = [self p_sharedInstance];
    if (factory.serverStorage[@(type)] == nil) {
        factory.serverStorage[@(type)] = [self p_createServerWithType:type];
    }
    return factory.serverStorage[@(type)];
}

#pragma mark - Private
+ (instancetype)p_sharedInstance {
    static JHServerFactory *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [JHServerFactory new];
    });
    return instance;
}

+ (JHBaseServer *)p_createServerWithType:(JHServer)type {
    NSString *className = @"";
    switch (type) {
        case JHServerMain:
            className = @"JHMainServer";
            break;
        case JHServerCount:
            className = @"JHCountServer";
            break;
        default:return nil;
    }
    return [NSClassFromString(className) new];
}

#pragma mark - Lazy laoding
- (NSMutableDictionary *)serverStorage {
    if (!_serverStorage) {
        _serverStorage = @{}.mutableCopy;
    }
    return _serverStorage;
}

@end
