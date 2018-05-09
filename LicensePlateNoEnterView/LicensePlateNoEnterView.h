//
//  LicensePlateNoEnterView.h
//  LicensePlateNoEnterView
//
//  Created by GK-MacBookPro on 2018/5/7.
//  Copyright © 2018年 GK-MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LicensePlateNoEnterView : UIView
@property (assign, nonatomic) BOOL isNewEnergyVehicles;   //!< 是否新能源车辆

-(void)hideKeyboardView;
@end
