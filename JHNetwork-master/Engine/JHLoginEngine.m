//
//  JHLoginEngine.m
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import "JHLoginEngine.h"
#import "JHRequestModel.h"

@implementation JHLoginEngine

+ (instancetype)loginWithUserName:(NSString *)userName pwd:(NSString *)pwd handler:(responseHandler)handler {
    NSDictionary *param = @{@"userName":userName,
                            @"pwd":pwd};
    JHRequestModel *model = [JHRequestModel modelWithServer:JHServerMain
                                                       path:@"login"
                                                     header:nil
                                                      param:param
                                                requestType:JHRequestTypeGet
                                              responseClass:nil
                                                  cacheType:JHCacheTypeCache
                                                  cacheTime:10];
    return [self engineWithRequestModel:model handler:handler];
}

@end
