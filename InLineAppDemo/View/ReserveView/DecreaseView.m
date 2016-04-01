//
//  DecreaseView.m
//  InLineAppDemo
//
//  Created by shadow on 2016/4/1.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import "DecreaseView.h"

@interface DecreaseView ()
@property (strong, nonatomic) IBOutlet UIView *decreaseView;
@end

@implementation DecreaseView

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.decreaseView = [[[UINib nibWithNibName:@"DecreaseView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        [self addSubview:self.decreaseView];
        [self setConstraint:self.decreaseView];
    }
    return self;
}

@end
