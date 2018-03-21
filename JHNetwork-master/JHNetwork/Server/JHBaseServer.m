//
//  JHBaseServer.m
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import "JHBaseServer.h"

@implementation JHBaseServer

- (NSString *)baseURL {
#ifdef DEBUG
    NSAssert(NO, @"Subclass must override this method.");
#endif
    return @"";
}

- (NSDictionary<NSString *,NSString *> *)header {
#ifdef DEBUG
    NSLog(@"You can override this method when you want add common header.");
#endif
    return @{};
}

@end
