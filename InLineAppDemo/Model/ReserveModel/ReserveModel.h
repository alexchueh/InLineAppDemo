//
//  ReserveModel.h
//  InLineAppDemo
//
//  Created by shadow on 2016/4/1.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import "BaseModel.h"

@interface ReserveModel : BaseModel

+ (ReserveModel *)sharedInstance;

@property (nonatomic, copy) NSString *minute;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *people;
@property (nonatomic, copy) NSString *chair;
@property (nonatomic, copy) NSString *tableware;
@property (nonatomic, copy) NSString *remark;

- (void)addReserveToData;

@end
