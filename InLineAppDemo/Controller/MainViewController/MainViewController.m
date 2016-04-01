//
//  MainViewController.m
//  InLineAppDemo
//
//  Created by shadow on 2016/3/30.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import "MainViewController.h"
#import "ReserveView.h"

@interface MainViewController ()
/**
 *  填寫訂位資料的頁面
 */
@property (weak, nonatomic) IBOutlet ReserveView *reserveView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setGestureRecognizer];
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
            self.reserveView.minute = [NSString stringWithFormat:@"%i",value];
        }
            break;
        case 1001: {
            
        }
            break;
        case 1002: {
            
        }
            break;
        case 1003: {
            
        }
            break;
            
        default:
            break;
    }
}

@end
