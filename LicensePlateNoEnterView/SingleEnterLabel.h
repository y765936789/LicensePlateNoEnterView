//
//  SingleEnterLabel.h
//  LicensePlateNoEnterView
//
//  Created by GK-MacBookPro on 2018/5/8.
//  Copyright © 2018年 GK-MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, InputViewType) {
    InputViewTypeChineseCharactor = 1001,  // 汉字
    InputViewTypelettersNumbers,  // 字母和数字
    InputViewTypeOther,
};
typedef NS_ENUM(NSUInteger, InputButtonType) {
    InputButtonTypeDefault = 2001,  // 汉字
    InputButtonTypeDelete,  // 字母和数字
    InputButtonTypeConfirm,
};
@class SingleEnterLabel;
@protocol SingleEnterLabelDelegate <NSObject>
-(void)didSelectedSinleEnterLabel:(SingleEnterLabel *)label
                       buttonType:(InputButtonType)buttonType;
@end

@interface SingleEnterLabel : UILabel
@property (strong, nonatomic,readwrite) UIView *inputView;
@property (assign, nonatomic) InputViewType inputViewType;
@property (weak, nonatomic) id <SingleEnterLabelDelegate> delegate;
-(void)done;
@end
