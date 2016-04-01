//
//  MainViewController.m
//  InLineAppDemo
//
//  Created by shadow on 2016/3/30.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import "MainViewController.h"
#import "ReserveModel.h"
#import "ReserveView.h"
#import "DetailTableView.h"

@interface MainViewController ()
/**
 *  填寫訂位資料的頁面
 */
@property (weak, nonatomic) IBOutlet ReserveView *reserveView;
@property (weak, nonatomic) IBOutlet DetailTableView *detailTableView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setGestureRecognizer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addReserve:) name:kAddReserve object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setGestureRecognizer {
    NSArray *array = @[self.reserveView.minuteView,self.reserveView.peopleView,self.reserveView.chairView,self.reserveView.tablewareView];
    for (int i = 0 ; i < [array count] ; i++) {
        UITapGestureRecognizer *singleFingerTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(decreaseViewTouch:)];
        DecreaseView *view = (DecreaseView *)array[i];
        [view addGestureRecognizer:singleFingerTap];
    }
}

- (void)decreaseViewTouch:(UITapGestureRecognizer *)recognizer {
    CGPoint point = [recognizer locationInView:recognizer.view];
    if (point.y <= self.reserveView.minuteView.frame.size.height / 2) {
        self.reserveView.decreaseValue = 1;
    }else {
        self.reserveView.decreaseValue = -1;
    }
    switch (recognizer.view.tag) {
        case 1000: {
            int value = [self.reserveView.minute intValue];
            value += self.reserveView.decreaseValue;
            if (value >= 0) {
                self.reserveView.minute = [NSString stringWithFormat:@"%i",value];
            }
        }
            break;
        case 1001: {
            int value = [self.reserveView.people intValue];
            value += self.reserveView.decreaseValue;
            if (value >= 0) {
                self.reserveView.people = [NSString stringWithFormat:@"%i",value];
            }
        }
            break;
        case 1002: {
            int value = [self.reserveView.chair intValue];
            value += self.reserveView.decreaseValue;
            if (value >= 0) {
                self.reserveView.chair = [NSString stringWithFormat:@"%i",value];
            }
        }
            break;
        case 1003: {
            int value = [self.reserveView.tableware intValue];
            value += self.reserveView.decreaseValue;
            if (value >= 0 ) {
                self.reserveView.tableware = [NSString stringWithFormat:@"%i",value];
            }
        }
            break;
            
        default:
            break;
    }
}

- (void)addReserve:(NSNotification*)notification {
    ReserveModel *reserveModel = [ReserveModel sharedInstance];
    reserveModel.minute = self.reserveView.minute;
    reserveModel.name = [NSString stringWithFormat:@"%@%@",self.reserveView.name.text,self.reserveView.gender.titleLabel.text];
    reserveModel.phone = self.reserveView.phone.text;
    reserveModel.people = self.reserveView.peopleLabel.text;
    reserveModel.chair = self.reserveView.chair;
    reserveModel.tableware = self.reserveView.tableware;
    reserveModel.remark = self.reserveView.remark.text;
    [reserveModel addReserveToData];
    [self.detailTableView reloadData];
    
}


@end
