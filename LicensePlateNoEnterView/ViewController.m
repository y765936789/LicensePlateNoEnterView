//
//  ViewController.m
//  LicensePlateNoEnterView
//
//  Created by GK-MacBookPro on 2018/5/7.
//  Copyright © 2018年 GK-MacBookPro. All rights reserved.
//

#import "ViewController.h"
#import "LicensePlateNoEnterView.h"

@interface ViewController ()
@property (strong, nonatomic) LicensePlateNoEnterView *licensePlateNoEnterView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    LicensePlateNoEnterView *view = [[LicensePlateNoEnterView alloc] initWithFrame:CGRectMake(0, 0, width - 20, 50)];
    view.center = self.view.center;
    [self.view addSubview:view];
    _licensePlateNoEnterView = view;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addKeyboardNotify];
}
- (IBAction)action:(UIButton *)sender {
    sender.selected = !sender.selected;
    _licensePlateNoEnterView.isNewEnergyVehicles = sender.selected;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.view endEditing:YES];
    [_licensePlateNoEnterView hideKeyboardView];
}

#pragma mark - Notices
- (void)addKeyboardNotify {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}
- (void)keyboardWillShow:(NSNotification *)notify {
    CGRect endRect = [notify.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    NSInteger height = endRect.size.height;
    NSLog(@"height = %ld",height);
    CGSize size = self.view.frame.size;
    [UIView animateWithDuration:0.15 animations:^{
        self.view.frame = CGRectMake(0, -height, size.width, size.height);
    }];
}
- (void)keyboardWillHide:(NSNotification *)notify {
    CGSize size = self.view.frame.size;
    [UIView animateWithDuration:0.15 animations:^{
        self.view.frame = CGRectMake(0, 0, size.width, size.height);
    }];
}
- (void)viewWillDisappear:(BOOL)animated {
    [self.view endEditing:YES];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super viewWillDisappear:animated];
}


@end
