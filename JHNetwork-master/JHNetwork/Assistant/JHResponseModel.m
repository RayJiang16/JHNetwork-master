//
//  JHResponseModel.m
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import "JHResponseModel.h"

@implementation JHResponseModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"success":@"return",
             @"msg":@"message"
             };
}

- (NSString *)description {
    return [NSString stringWithFormat:@"success:%d, ecode:%ld, msg:%@, obj:%@", self.isSuccess, self.ecode, self.msg, self.obj];
}

@end
