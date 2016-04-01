//
//  DetailTableView.m
//  InLineAppDemo
//
//  Created by shadow on 2016/3/31.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import "DetailTableView.h"
#import "DetailTableViewCell.h"
#import "DetailModel.h"

@interface DetailTableView ()
@property (strong, nonatomic) IBOutlet UITableView *detailTableView;
@property (nonatomic, strong) DetailModel *detailModel;
@property (nonatomic, strong) NSMutableArray *reserveArray;

@end

@implementation DetailTableView

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.detailTableView = [[[UINib nibWithNibName:@"DetailTableView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        [self addSubview:self.detailTableView];
        [self setConstraint:self.detailTableView];
        self.delegate = self;
        self.dataSource = self;
        self.detailModel = [DetailModel sharedInstance];
    }
    return self;
}

#pragma mark UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
    return [self.detailModel.reserveArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailTableViewCell *cell = (DetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DetailTableViewCell"];
    if (cell == nil) {
        NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"DetailTableViewCell" owner:self options:nil];
        cell = [objects objectAtIndex:0];
    }
    NSArray *array = self.detailModel.reserveArray;
    NSDictionary *dictionary = array[indexPath.row];
    NSString *minute = dictionary[kMinute];
    NSString *name = dictionary[kName];
    NSString *phone = dictionary[kPhone];
    NSString *people = dictionary[kPeople];
    NSString *chair = dictionary[kChair];
    NSString *tableware = dictionary[kTableware];
    NSString *remark = dictionary[kRemark];
    
    [cell.peopleNumber setText:people];
    [cell.name setText:[NSString stringWithFormat:@"%@(%@兒椅%@兒餐)",name,chair,tableware]];
    [cell.phone setText:phone];
    [cell.remark setText:remark];
    [cell.time setText:[NSString stringWithFormat:@"%@分前",minute]];
    
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}


@end
