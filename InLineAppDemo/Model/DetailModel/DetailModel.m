//
//  DetailModel.m
//  InLineAppDemo
//
//  Created by shadow on 2016/4/1.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel

+ (DetailModel *)sharedInstance {
    static id detailModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        detailModel = [[DetailModel alloc]init];
    });
    return detailModel;
}

@end
