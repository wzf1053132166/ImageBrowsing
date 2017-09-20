//
//  InsuredVehicle.h
//  aichediandian
//
//  Created by MACPRO  on 16/6/13.
//  Copyright © 2016年 rwxChina. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InsuredVehicleViewDelegate <NSObject>
@optional
- (void)sure;
@end

@interface InsuredVehicle : UIView

@property (weak, nonatomic) id <InsuredVehicleViewDelegate> delegate;

@property (nonatomic, weak)UIViewController *parentVC;

@property (strong, nonatomic) IBOutlet InsuredVehicle *insuredVehicleView;



@end
