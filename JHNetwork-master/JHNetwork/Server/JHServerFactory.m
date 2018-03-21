//
//  JHServerFactory.m
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import "JHServerFactory.h"
#import "JHBaseServer.h"

#import "JHMainServer.h"
#import "JHCountServer.h"

@interface JHServerFactory ()
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, JHBaseServer *> *serverStorage;

@end

@implementation JHServerFactory

+ (instancetype)sharedInstance {
    static JHServerFactory *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [JHServerFactory new];
    });
    return instance;
}

- (JHBaseServer *)serverWithType:(JHServer)type {
    if (self.serverStorage[@(type)] == nil) {
        self.serverStorage[@(type)] = [self p_createServerWithType:type];
    }
    return self.serverStorage[@(type)];
}

#pragma mark - Private
- (JHBaseServer *)p_createServerWithType:(JHServer)type {
    switch (type) {
        case JHServerMain: return [JHMainServer new];
        case JHServerCount:return [JHCountServer new];
        default: return nil;
    }
}

#pragma mark - Lazy laoding
- (NSMutableDictionary *)serverStorage {
    if (!_serverStorage) {
        _serverStorage = @{}.mutableCopy;
    }
    return _serverStorage;
}

@end
