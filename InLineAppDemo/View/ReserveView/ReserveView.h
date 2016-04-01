//
//  ReserveView.h
//  InLineAppDemo
//
//  Created by shadow on 2016/3/30.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import "BaseView.h"
#import "DecreaseView.h"
#import "DCRoundSwitch.h"

@interface ReserveView : BaseView

+ (ReserveView *)sharedInstance;
@property (weak, nonatomic) IBOutlet DCRoundSwitch *addReserve;
@property (weak, nonatomic) IBOutlet UIButton *gender;
#pragma mark - 調整數量的頁面
/**
 *  調整分鐘數
 */
@property (weak, nonatomic) IBOutlet DecreaseView *minuteView;
/**
 *  調整人數
 */
@property (weak, nonatomic) IBOutlet DecreaseView *peopleView;
/**
 *  調整兒童椅數量
 */
@property (weak, nonatomic) IBOutlet DecreaseView *chairView;
/**
 *  調整兒童餐具數量
 */
@property (weak, nonatomic) IBOutlet DecreaseView *tablewareView;
/**
 *  記錄增加還是減少
 */
@property (nonatomic, assign) int decreaseValue;


#pragma mark - UserReserveData
/**
 *  分鐘
 */
@property (weak, nonatomic) IBOutlet UILabel *minuteLabel;
@property (nonatomic, copy) NSString *minute;
/**
 *  姓氏
 */
@property (weak, nonatomic) IBOutlet UITextField *name;
/**
 *  電話
 */
@property (weak, nonatomic) IBOutlet UITextField *phone;
/**
 *  人數（大人）
 */
@property (weak, nonatomic) IBOutlet UILabel *peopleLabel;
@property (nonatomic, copy) NSString *people;
/**
 *  兒童椅
 */
@property (weak, nonatomic) IBOutlet UILabel *chairLabel;
@property (nonatomic, copy) NSString *chair;
/**
 *  兒童餐具
 */
@property (weak, nonatomic) IBOutlet UILabel *tablewareLabel;
@property (nonatomic, copy) NSString *tableware;
/**
 *  備註
 */
@property (weak, nonatomic) IBOutlet UITextField *remark;

@end
