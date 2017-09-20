//
//  PhotoZoom.h
//  TMC
//
//  Created by wzf on 2017/9/6.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PhotoDelegate;
#define MaxSCale 2.7  //最大缩放比例
#define MinScale 1.0  //最小缩放比例

@interface PhotoZoom : UIScrollView

///当前显示的图片
@property (nonatomic, strong) id zoom_image;
@property (nonatomic, assign) CGRect imageV;
@property (nonatomic, assign) PushWay way;

@property (nonatomic, weak) id<PhotoDelegate> photo_delegate;
@end

@protocol PhotoDelegate <NSObject>

@optional
- (void)singleClickWithPhoto:(PhotoZoom *)photo photoImageView:(UIImageView *)photoImageView;

@end

