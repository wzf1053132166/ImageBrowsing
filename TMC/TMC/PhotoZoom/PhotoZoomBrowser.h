//
//  PhotoZoomBrowser.h
//  TMC
//
//  Created by wzf on 2017/9/6.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PhotoBrowserDelegate;

@interface PhotoZoomBrowser : UIViewController

@property (nonatomic, weak) id<PhotoBrowserDelegate> delegate;

- (instancetype)initWithImages:(NSArray<UIImage *> *)images imageFrame:(NSArray<UIImageView *> *)imageFrame currentIndex:(NSInteger)currentIndex way:(PushWay)way;

@end

@protocol PhotoBrowserDelegate <NSObject>

@optional
- (void)photoBrowser:(PhotoZoomBrowser *)photoBrowser didSelectImage:(id)image photoIndex:(NSInteger)photoIndex;

@end
