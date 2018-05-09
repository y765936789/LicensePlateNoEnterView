//
//  LicensePlateNoEnterView.m
//  LicensePlateNoEnterView
//
//  Created by GK-MacBookPro on 2018/5/7.
//  Copyright © 2018年 GK-MacBookPro. All rights reserved.
//

#import "LicensePlateNoEnterView.h"
#import "SingleEnterLabel.h"

@interface LicensePlateNoEnterView ()
@property (strong, nonatomic) NSMutableArray *labelArray;
@property (strong, nonatomic) SingleEnterLabel *lastLabel;
@end

@implementation LicensePlateNoEnterView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self creatSubViewsWithFrame:frame];
    }
    return self;
}

-(void)creatSubViewsWithFrame:(CGRect)frame {
    NSInteger count = 8;
    CGFloat space = 5.0f;
    CGFloat separateWidth = 20;
    CGFloat totalSpace = (count - 1) * space;
    
    CGFloat width = (frame.size.width - totalSpace - separateWidth) / count;
    CGFloat height = frame.size.height;
    for (NSInteger i = 0; i < count; i ++) {
        CGRect frame = CGRectMake((width + space) * i, 0, width, height);
        if (i > 1) {
            frame.origin.x = (width + space) * i + separateWidth;
        }
        SingleEnterLabel *textLabel = [[SingleEnterLabel alloc]initWithFrame:frame];
        if (i == 1) {
            textLabel.inputViewType = InputViewTypelettersNumbers;
        } else if (i > 1) {
            textLabel.inputViewType = InputViewTypeOther;
        }
        textLabel.tag = i;
        textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:textLabel];
        textLabel.layer.borderWidth = 1;
        textLabel.layer.borderColor = [UIColor blackColor].CGColor;
        [self.labelArray addObject:textLabel];
        if (i  == count - 1) {
            textLabel.hidden = YES;
        }
        UITapGestureRecognizer *tapLabel = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapLabelClick:)];
        textLabel.userInteractionEnabled = YES;
        tapLabel.numberOfTapsRequired = 1;
        tapLabel.delaysTouchesBegan = YES;
        [textLabel addGestureRecognizer:tapLabel];
        textLabel.delegate = (id <SingleEnterLabelDelegate>)self;
    }
    CGRect rect = CGRectMake(width * 2 + space, 0, separateWidth + space, height);
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"·";
    [self addSubview:label];
}

-(void)setIsNewEnergyVehicles:(BOOL)isNewEnergyVehicles {
    _isNewEnergyVehicles = isNewEnergyVehicles;
    UILabel *label = [self.labelArray lastObject];
    if (label) {
        label.hidden = !isNewEnergyVehicles;
        label.text = @"";
    }
}
-(NSMutableArray *)labelArray {
    if (!_labelArray) {
        _labelArray = [@[] mutableCopy];
    }
    return _labelArray;
}

- (void)tapLabelClick:(UITapGestureRecognizer *)tap{
    _lastLabel.layer.borderColor = [UIColor blackColor].CGColor;
    UIView *view = tap.view;
    [view becomeFirstResponder];
    _lastLabel = (SingleEnterLabel *)view;
    
}

-(void)hideKeyboardView {
    if (_lastLabel) {
        [_lastLabel done];
    }
}

-(void)didSelectedSinleEnterLabel:(SingleEnterLabel *)label
                       buttonType:(InputButtonType)buttonType {
    switch (buttonType) {
        case InputButtonTypeDefault:
            [self nextLabel:label];
            break;
        case InputButtonTypeConfirm:
            break;
        case InputButtonTypeDelete:
            [self deleteLabel:label];
            break;
    }
}

-(void)nextLabel:(SingleEnterLabel *)label {
    NSInteger count = self.isNewEnergyVehicles ? 7 : 6;
    if (label.tag == count) {
        [label done];
        return;
    }
    SingleEnterLabel *nextLabel = self.labelArray[label.tag + 1];
    [nextLabel becomeFirstResponder];
    _lastLabel = nextLabel;
}
-(void)deleteLabel:(SingleEnterLabel *)label {
    label.text = @"";
    label.layer.borderColor = [UIColor blackColor].CGColor;
    SingleEnterLabel *nextLabel = self.labelArray[label.tag - 1];
    [nextLabel becomeFirstResponder];
    _lastLabel = nextLabel;
}
@end
