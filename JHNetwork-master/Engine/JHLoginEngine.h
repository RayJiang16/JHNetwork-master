//
//  JHLoginEngine.h
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import "JHBaseEngine.h"

@interface JHLoginEngine : JHBaseEngine

+ (instancetype)loginWithUserName:(NSString *)userName pwd:(NSString *)pwd handler:(responseHandler)handler;

@end
