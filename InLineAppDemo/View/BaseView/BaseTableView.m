//
//  BaseTableView.m
//  InLineAppDemo
//
//  Created by shadow on 2016/4/1.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

- (void)setConstraint:(UIView *)customView {
    customView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[self pin:customView attribute:NSLayoutAttributeTop]];
    [self addConstraint:[self pin:customView attribute:NSLayoutAttributeLeft]];
    [self addConstraint:[self pin:customView attribute:NSLayoutAttributeBottom]];
    [self addConstraint:[self pin:customView attribute:NSLayoutAttributeRight]];
}

- (NSLayoutConstraint *)pin:(id)item attribute:(NSLayoutAttribute)attribute {
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:item
                                        attribute:attribute
                                       multiplier:1.0
                                         constant:0.0];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
