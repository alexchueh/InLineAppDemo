//
//  BaseTableView.h
//  InLineAppDemo
//
//  Created by shadow on 2016/4/1.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveCocoa.h"

@interface BaseTableView : UITableView

/**
 *  設定Constraint使之根據Autolayout去做調整
 *
 *  @param customView 客制的Xib View
 */
- (void)setConstraint:(UIView *)customView;

@end
