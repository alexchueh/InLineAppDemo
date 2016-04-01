//
//  ReserveView.m
//  InLineAppDemo
//
//  Created by shadow on 2016/3/30.
//  Copyright © 2016年 shadow. All rights reserved.
//

#import "ReserveView.h"
#import "DCRoundSwitch.h"

@interface ReserveView ()
@property (strong, nonatomic) IBOutlet UIView *reserveView;
@property (weak, nonatomic) IBOutlet UILabel *customerLabel;
@property (weak, nonatomic) IBOutlet UIButton *gender;
@property (weak, nonatomic) IBOutlet DCRoundSwitch *addReserve;
@property (nonatomic, assign) CGRect newFrame;


#pragma mark - NSLayoutConstraint
/**
 *  姓氏跟手機的間距
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *surnameWithPhone;
/**
 *  手機跟大人的間距
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *phoneWithPeople;
/**
 *  大人跟兒童椅的間距
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *peopleWithChair;
/**
 *  兒童椅跟兒童餐具的間距
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *chairWithTableware;
/**
 *  兒童餐具跟備註的間距
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tablewareWithRemark;

@end

@implementation ReserveView

+ (ReserveView *)sharedInstance {
    static id reserveView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        reserveView = [[ReserveView alloc]init];
    });
    return reserveView;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.reserveView = [[[UINib nibWithNibName:@"ReserveView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        [self addSubview:self.reserveView];
        [self setConstraint:self.reserveView];
        [self setViewStyle];
        [self setPropertyData];
//        [self setGestureRecognizer];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    self.newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//    self.reserveView.frame = self.newFrame;
    //判斷當前裝置的擺向
    [self setVideoOrientation];
    
}

//- (void)setGestureRecognizer {
//    NSArray *array = @[self.minuteView,self.peopleView,self.chairView,self.tablewareView];
//    for (int i = 0 ; i < [array count] ; i++) {
//        UITapGestureRecognizer *singleFingerTap =
//        [[UITapGestureRecognizer alloc] initWithTarget:self
//                                                action:@selector(decreaseViewTouch:)];
//        DecreaseView *view = (DecreaseView *)array[i];
//        [view addGestureRecognizer:singleFingerTap];
//    }
//}

- (void)setVideoOrientation {
    //TODO 要將所有TextField的keyboard縮回
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
        //如果是豎屏將間距設定為60
        [self setConstantHeight:60];
    }else if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight) {
        //如果是橫屏將間距設定為30
        [self setConstantHeight:30];
    }
}

- (void)setConstantHeight:(CGFloat)spacingHeight {
    //設定每個欄位的間距
    self.surnameWithPhone.constant = spacingHeight;
    self.phoneWithPeople.constant = spacingHeight;
    self.peopleWithChair.constant = spacingHeight;
    self.chairWithTableware.constant = spacingHeight;
    self.tablewareWithRemark.constant = spacingHeight;
}

- (void)setViewStyle {
    self.customerLabel.layer.cornerRadius = 11;
    self.customerLabel.clipsToBounds = YES;
    
    self.addReserve.onText = @"已新增預約";
    self.addReserve.offText = @"滑動確認排入";
    self.addReserve.on = NO;
}

- (void)setPropertyData {
    [RACObserve(self, minute) subscribeNext:^(NSString *minute) {
        self.minuteLabel.text = minute;
    }];
    [RACObserve(self, name) subscribeNext:^(NSString *name) {
        
    }];
    [RACObserve(self, phone) subscribeNext:^(NSString *phone) {
        
    }];
    [RACObserve(self, people) subscribeNext:^(NSString *people) {
        
    }];
    [RACObserve(self, chair) subscribeNext:^(NSString *chair) {
        
    }];
    [RACObserve(self, tableware) subscribeNext:^(NSString *tableware) {
        
    }];
    [RACObserve(self, remark) subscribeNext:^(NSString *remark) {
        
    }];
}

#pragma mark - 改變性別
- (IBAction)setGenderTitle:(id)sender {
    UIButton *button = (UIButton *)sender;
    if ([button.titleLabel.text isEqualToString:@"先生"]) {
        [button setTitle:@"小姐" forState:UIControlStateNormal];
    }else {
        [button setTitle:@"先生" forState:UIControlStateNormal];
    }
}

//- (void)decreaseViewTouch:(UITapGestureRecognizer *)recognizer {
//    CGPoint point = [recognizer locationInView:recognizer.view];
//    if (point.y <= self.minuteView.frame.size.height / 2) {
//        self.decreaseValue = 1;
//    }else {
//        self.decreaseValue = -1;
//    }
//    NSLog(@"decreaseValue:%i",self.decreaseValue);
//    switch (recognizer.view.tag) {
//        case 1000: {
//            
//        }
//            break;
//        case 1001: {
//            
//        }
//            break;
//        case 1002: {
//            
//        }
//            break;
//        case 1003: {
//            
//        }
//            break;
//            
//        default:
//            break;
//    }
//}



@end
