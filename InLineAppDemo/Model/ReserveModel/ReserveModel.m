//
//  ReserveModel.m
//  InLineAppDemo
//
//  Created by shadow on 2016/4/1.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import "ReserveModel.h"

@implementation ReserveModel

+ (ReserveModel *)sharedInstance {
    static id reserveModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        reserveModel = [[ReserveModel alloc]init];
    });
    return reserveModel;
}

@end
