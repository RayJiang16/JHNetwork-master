//
//  JHRequestGenerator.h
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JHRequestModel;

@interface JHRequestGenerator : NSObject

/**
 根据RequestModel中的属性生成NSURLRequest

 @param model 模型对象
 @return NSURLRequest
 */
+ (NSURLRequest *)requestWithModel:(JHRequestModel *)model;

@end
