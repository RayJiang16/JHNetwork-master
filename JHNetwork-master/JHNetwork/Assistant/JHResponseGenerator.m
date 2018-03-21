//
//  JHResponseGenerator.m
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import "JHResponseGenerator.h"
#import "JHResponseModel.h"
#import <YYModel.h>

@implementation JHResponseGenerator

+ (JHResponseModel *)failModel {
    JHResponseModel *model = [JHResponseModel new];
    model.success = NO;
    model.ecode   = 0;
    model.obj     = nil;
    model.msg     = @"You can set message when request error.";
    return model;
}

+ (JHResponseModel *)modelWithDict:(NSDictionary *)dict cls:(Class)cls {
    JHResponseModel *model = [self p_classWithDictionary:dict andModelClass:[JHResponseModel class]];
    model.obj = nil;
    if (model.isSuccess && cls) {
        model.obj = [self p_objectWithDictionary:dict andModelClass:cls];
    }
    return model;
}

+ (JHResponseModel *)cacheModelWithDict:(NSDictionary *)dict cls:(Class)cls {
    JHResponseModel *model = [self modelWithDict:dict cls:cls];
    [model setValue:@(1) forKey:@"cache"];
    return model;
}

#pragma mark - Privete
/** 解析特有对象 */
+ (id)p_objectWithDictionary:(NSDictionary *)dict andModelClass:(Class)andModelClass {
#ifdef DEBUG
    NSLog(@"Make sure objtctKey is the same as object filed name where in response.");
#endif
    // TODO: 请根据实际API中的参数修改字段名
    static NSString *const objectKey = @"res";
    if ([dict[objectKey] isKindOfClass:[NSDictionary class]]) {
        return [self p_classWithDictionary:dict[objectKey] andModelClass:andModelClass];
    } else if ([dict[objectKey] isKindOfClass:[NSArray class]]) {
        return [self p_arrayWithArray:dict[objectKey] andModelClass:andModelClass];
    }
    return nil;
}

/** 将JSON字典转成对象 */
+ (id)p_classWithDictionary:(NSDictionary *)dict andModelClass:(Class)modelClass {
    return [modelClass yy_modelWithDictionary:dict];
}

/** 将一个JSON数组转成一个对象数组 */
+ (NSArray *)p_arrayWithArray:(NSArray *)array andModelClass:(Class)modelClass {
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        id instance = [self p_classWithDictionary:dict andModelClass:modelClass];
        [mutableArray addObject:instance];
    }
    return [mutableArray copy];
}

@end
