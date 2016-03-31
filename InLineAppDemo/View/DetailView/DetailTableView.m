//
//  DetailTableView.m
//  InLineAppDemo
//
//  Created by shadow on 2016/3/31.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import "DetailTableView.h"
#import "DetailTableViewCell.h"

@interface DetailTableView ()
@property (strong, nonatomic) IBOutlet UITableView *detailTableView;

@end

@implementation DetailTableView

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.detailTableView = [[[UINib nibWithNibName:@"DetailTableView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        [self addSubview:self.detailTableView];
        [self setConstraint:self.detailTableView];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailTableViewCell *cell = (DetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DetailTableViewCell"];
    if (cell == nil) {
        NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"DetailTableViewCell" owner:self options:nil];
        cell = [objects objectAtIndex:0];
    }
    
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

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

@end
