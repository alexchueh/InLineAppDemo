//
//  ReserveModel.m
//  InLineAppDemo
//
//  Created by shadow on 2016/4/1.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import "ReserveModel.h"
#import "DetailModel.h"

@implementation ReserveModel

+ (ReserveModel *)sharedInstance {
    static id reserveModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        reserveModel = [[ReserveModel alloc]init];
    });
    return reserveModel;
}

- (void)addReserveToData {
    DetailModel *detailModel = [DetailModel sharedInstance];
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    if ([self.minute length] > 0) {
        [dictionary setObject:self.minute forKey:kMinute];
    }
    if ([self.name length] > 0) {
        [dictionary setObject:self.name forKey:kName];
    }
    if ([self.phone length] > 0) {
        [dictionary setObject:self.phone forKey:kPhone];
    }
    if ([self.people length] > 0) {
        [dictionary setObject:self.people forKey:kPeople];
    }
    if ([self.chair length] > 0) {
        [dictionary setObject:self.chair forKey:kChair];
    }
    if ([self.tableware length] > 0) {
        [dictionary setObject:self.tableware forKey:kTableware];
    }
    if ([self.remark length] > 0) {
        [dictionary setObject:self.remark forKey:kRemark];
    }
    if (detailModel.reserveArray == nil) {
        detailModel.reserveArray = [NSMutableArray array];
    }
    [detailModel.reserveArray insertObject:dictionary atIndex:0];
}

@end
