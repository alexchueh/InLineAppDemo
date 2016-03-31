//
//  DetailTableViewCell.h
//  InLineAppDemo
//
//  Created by shadow on 2016/3/31.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewCell : UITableViewCell

/**
 *  訂位人數
 */
@property (weak, nonatomic) IBOutlet UILabel *peopleNumber;
/**
 *  訂位大名
 */
@property (weak, nonatomic) IBOutlet UILabel *name;
/**
 *  訂位者電話
 */
@property (weak, nonatomic) IBOutlet UILabel *phone;
/**
 *  備註
 */
@property (weak, nonatomic) IBOutlet UILabel *remark;
/**
 *  時間
 */
@property (weak, nonatomic) IBOutlet UILabel *time;
@end
