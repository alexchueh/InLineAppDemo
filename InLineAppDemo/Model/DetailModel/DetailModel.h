//
//  DetailModel.h
//  InLineAppDemo
//
//  Created by shadow on 2016/4/1.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import "BaseModel.h"

@interface DetailModel : BaseModel

+ (DetailModel *)sharedInstance;

@property (nonatomic, strong) NSMutableArray *reserveArray;

@end
