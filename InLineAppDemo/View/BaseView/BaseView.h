//
//  BaseView.h
//  InLineAppDemo
//
//  Created by shadow on 2016/3/30.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

/**
 *  設定Constraint使之根據Autolayout去做調整
 *
 *  @param customView 客制的Xib View
 */
- (void)setConstraint:(UIView *)customView;


@end
