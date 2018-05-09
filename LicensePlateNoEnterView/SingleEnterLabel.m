//
//  SingleEnterLabel.m
//  LicensePlateNoEnterView
//
//  Created by GK-MacBookPro on 2018/5/8.
//  Copyright © 2018年 GK-MacBookPro. All rights reserved.
//

#import "SingleEnterLabel.h"

@implementation SingleEnterLabel

-(instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.inputViewType = InputViewTypeChineseCharactor;
    }
    return self;
}
//重写get方法
- (UIView *)inputView{
    if (!_inputView) {
        _inputView = [self creatInputViewWithType:self.inputViewType];
    }
    return _inputView;
}
- (BOOL)canBecomeFirstResponder{
    return YES;
}
- (void)done{
    [self resignFirstResponder];
    self.layer.borderColor = [UIColor blackColor].CGColor;
}
- (BOOL)becomeFirstResponder {
    self.layer.borderColor = [UIColor orangeColor].CGColor;
    return [super becomeFirstResponder];
}

// 自定义键盘的按钮布局
-(UIView *)creatInputViewWithType:(InputViewType)type {
    switch (type) {
        case InputViewTypeChineseCharactor:
            return [self ChineseCharactorKeyboardView];
            break;
        case InputViewTypelettersNumbers:
            return [self lettersNumbersKeyboardView];
            break;
        case InputViewTypeOther:
            return [self otherKeyboardView];
            break;
    }
    return nil;
}
-(UIView *)otherKeyboardView {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = (screenWidth - 55 ) / 10;
    CGFloat height = x * 4 + 25;
    UIView *bgView = [[UIView  alloc] initWithFrame:CGRectMake(0, 0, screenWidth, height)];
    bgView.backgroundColor = [UIColor lightGrayColor];
    // 第一排10个
    NSArray *line1 = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    for (int i = 0; i < line1.count; i++) {
        CGRect rect = CGRectMake(i * (x + 5) + 5, 5, x, x);
        UIButton *button = [self buttonWithTitle:line1[i] frame:rect action:@selector(buttonAction:)];
        [bgView addSubview:button];
    }
    // 第二排8个
    NSArray *line2 = @[@"Q",@"W",@"E",@"R",@"T",@"Y",@"U",@"P"];
    for (int i = 0; i < line2.count; i++) {
        CGRect rect = CGRectMake((i + 1) * (x + 5) + 5, 5 + x + 5, x, x);
        UIButton *button = [self buttonWithTitle:line2[i] frame:rect action:@selector(buttonAction:)];
        [bgView addSubview:button];
    }
    // 第三排9个
    NSArray *line3 = @[@"A",@"S",@"D",@"F",@"G",@"H",@"J",@"K",@"L"];
    for (int i = 0; i < line3.count; i++) {
        CGRect rect = CGRectMake(i * (x + 5) + 5 + x * 0.5 + 2.5, 5 * 3 + x * 2, x, x);
        UIButton *button = [self buttonWithTitle:line3[i] frame:rect action:@selector(buttonAction:)];
        [bgView addSubview:button];
    }
    // 第四排7个
    NSArray *line4 = @[@"Z",@"X",@"C",@"V",@"B",@"N",@"M"];
    for (int i = 0; i < line4.count; i++) {
        CGRect rect = CGRectMake((i + 1) * (x + 5) + 5 + x * 0.5 + 2.5, 5 * 4 + x * 3, x, x);
        UIButton *button = [self buttonWithTitle:line4[i] frame:rect action:@selector(buttonAction:)];
        [bgView addSubview:button];
    }
    // 删除
    CGRect rect = CGRectMake(5, 5 * 4 + x * 3, x * 1.5 + 2.5, x);
    UIButton *button = [self buttonWithTitle:@"删除" frame:rect action:@selector(deleteButtonAction:)];
    [bgView addSubview:button];
    // 确定
    CGRect rect1 = CGRectMake((7 + 1) * (x + 5) + 5 + x * 0.5 + 2.5, 5 * 4 + x * 3, x * 1.5 + 2.5, x);
    UIButton *button1 = [self buttonWithTitle:@"确定" frame:rect1 action:@selector(confirmButtonAction:)];
    [bgView addSubview:button1];
    return bgView;
}
-(UIView *)lettersNumbersKeyboardView {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = (screenWidth - 55 ) / 10;
    CGFloat height = x * 4 + 25;
    UIView *bgView = [[UIView  alloc] initWithFrame:CGRectMake(0, 0, screenWidth, height)];
    bgView.backgroundColor = [UIColor lightGrayColor];
    // 第一排10个
    NSArray *line1 = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    for (int i = 0; i < line1.count; i++) {
        CGRect rect = CGRectMake(i * (x + 5) + 5, 5, x, x);
        UIButton *button = [self buttonWithTitle:line1[i] frame:rect action:@selector(buttonAction:)];
        [bgView addSubview:button];
    }
    // 第二排10个
    NSArray *line2 = @[@"Q",@"W",@"E",@"R",@"T",@"Y",@"U",@"I",@"O",@"P"];
    for (int i = 0; i < line2.count; i++) {
        CGRect rect = CGRectMake(i * (x + 5) + 5, 5 + x + 5, x, x);
        UIButton *button = [self buttonWithTitle:line2[i] frame:rect action:@selector(buttonAction:)];
        [bgView addSubview:button];
    }
    // 第三排9个
    NSArray *line3 = @[@"A",@"S",@"D",@"F",@"G",@"H",@"J",@"K",@"L"];
    for (int i = 0; i < line3.count; i++) {
        CGRect rect = CGRectMake(i * (x + 5) + 5 + x * 0.5 + 2.5, 5 * 3 + x * 2, x, x);
        UIButton *button = [self buttonWithTitle:line3[i] frame:rect action:@selector(buttonAction:)];
        [bgView addSubview:button];
    }
    // 第四排7个
    NSArray *line4 = @[@"Z",@"X",@"C",@"V",@"B",@"N",@"M"];
    for (int i = 0; i < line4.count; i++) {
        CGRect rect = CGRectMake((i + 1) * (x + 5) + 5 + x * 0.5 + 2.5, 5 * 4 + x * 3, x, x);
        UIButton *button = [self buttonWithTitle:line4[i] frame:rect action:@selector(buttonAction:)];
        [bgView addSubview:button];
    }
    // 删除
    CGRect rect = CGRectMake(5, 5 * 4 + x * 3, x * 1.5 + 2.5, x);
    UIButton *button = [self buttonWithTitle:@"删除" frame:rect action:@selector(deleteButtonAction:)];
    [bgView addSubview:button];
    // 确定
    CGRect rect1 = CGRectMake((7 + 1) * (x + 5) + 5 + x * 0.5 + 2.5, 5 * 4 + x * 3, x * 1.5 + 2.5, x);
    UIButton *button1 = [self buttonWithTitle:@"确定" frame:rect1 action:@selector(confirmButtonAction:)];
    [bgView addSubview:button1];
    return bgView;
}
-(UIView *)ChineseCharactorKeyboardView {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = (screenWidth - 55 ) / 10;
    CGFloat height = x * 4 + 25;
    UIView *bgView = [[UIView  alloc] initWithFrame:CGRectMake(0, 0, screenWidth, height)];
    bgView.backgroundColor = [UIColor lightGrayColor];
    // 第一排10个
    NSArray *line1 = @[@"京",@"津",@"渝",@"沪",@"冀",@"晋",@"辽",@"吉",@"黑",@"苏"];
    for (int i = 0; i < line1.count; i++) {
        CGRect rect = CGRectMake(i * (x + 5) + 5, 5, x, x);
        UIButton *button = [self buttonWithTitle:line1[i] frame:rect action:@selector(buttonAction:)];
        [bgView addSubview:button];
    }
    // 第二排10个
    NSArray *line2 = @[@"浙",@"皖",@"闽",@"赣",@"鲁",@"豫",@"鄂",@"湘",@"粤",@"琼"];
    for (int i = 0; i < line2.count; i++) {
        CGRect rect = CGRectMake(i * (x + 5) + 5, 5 + x + 5, x, x);
        UIButton *button = [self buttonWithTitle:line2[i] frame:rect action:@selector(buttonAction:)];
        [bgView addSubview:button];
    }
    // 第三排10个
    NSArray *line3 = @[@"川",@"贵",@"云",@"陕",@"甘",@"青",@"蒙",@"桂",@"宁",@"新"];
    for (int i = 0; i < line3.count; i++) {
        CGRect rect = CGRectMake(i * (x + 5) + 5, 5 * 3 + x * 2, x, x);
        UIButton *button = [self buttonWithTitle:line3[i] frame:rect action:@selector(buttonAction:)];
        [bgView addSubview:button];
    }
    // 第四排7个
    NSArray *line4 = @[@"藏",@"使",@"领",@"警",@"学",@"港",@"澳"];
    for (int i = 0; i < line4.count; i++) {
        CGRect rect = CGRectMake((i + 1) * (x + 5) + 5 + x * 0.5 + 2.5, 5 * 4 + x * 3, x, x);
        UIButton *button = [self buttonWithTitle:line4[i] frame:rect action:@selector(buttonAction:)];
        [bgView addSubview:button];
    }
    // 确定
    CGRect rect1 = CGRectMake((7 + 1) * (x + 5) + 5 + x * 0.5 + 2.5, 5 * 4 + x * 3, x * 1.5 + 2.5, x);
    UIButton *button1 = [self buttonWithTitle:@"确定" frame:rect1 action:@selector(confirmButtonAction:)];
    [bgView addSubview:button1];
    return bgView;
}
-(UIButton *)buttonWithTitle:(NSString *)title frame:(CGRect)frame action:(SEL)action {
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.layer.borderWidth = 1;
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    return button;
}
-(void)deleteButtonAction:(UIButton *)button {
    if (self.delegate  && [self.delegate respondsToSelector:@selector(didSelectedSinleEnterLabel:buttonType:)]) {
        [self.delegate didSelectedSinleEnterLabel:self
                                       buttonType:InputButtonTypeDelete];
    }
}
-(void)confirmButtonAction:(UIButton *)button {
    [self done];
    if (self.delegate  && [self.delegate respondsToSelector:@selector(didSelectedSinleEnterLabel:buttonType:)]) {
        [self.delegate didSelectedSinleEnterLabel:self
                                       buttonType:InputButtonTypeConfirm];
    }
}
-(void)buttonAction:(UIButton *)button {
    self.text = button.titleLabel.text;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    if (self.delegate  && [self.delegate respondsToSelector:@selector(didSelectedSinleEnterLabel:buttonType:)]) {
        [self.delegate didSelectedSinleEnterLabel:self
                                       buttonType:InputButtonTypeDefault];
    }
}

@end
