//
//  PhotoZoom.m
//  TMC
//
//  Created by wzf on 2017/9/6.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "PhotoZoom.h"
#import <ImageIO/ImageIO.h>

@interface PhotoZoom ()<UIScrollViewDelegate>
{
    UIImageView *_imageView;
    UIImage     *_currentImage;
    NSMutableArray *_images;
    CGFloat     _totalTime;
    
}
@end

@implementation PhotoZoom


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.minimumZoomScale = MinScale;
        self.maximumZoomScale = MaxSCale;
        self.backgroundColor  = [UIColor clearColor];
        _images   = [[NSMutableArray alloc] initWithCapacity:1];
        _imageView = [[UIImageView alloc] init];
        _imageView.userInteractionEnabled = YES;
        [self addSubview:_imageView];
        
        UITapGestureRecognizer *single = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleClick:)];
        [self addGestureRecognizer:single];
        
        UITapGestureRecognizer *doubleClick = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
        doubleClick.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleClick];
        
        [single requireGestureRecognizerToFail:doubleClick];
    }
    return self;
}

#pragma mark -- 设置当前显示的图片
- (void)setZoom_image:(id)zoom_image{
    
    if (_images.count > 1) {
        _totalTime = 0;
        [_imageView stopAnimating];
        [_images removeAllObjects];
    }
    
    _zoom_image = zoom_image;
    _imageView.image = nil;
    
    if ([zoom_image isKindOfClass:[UIImage class]]) {
        _currentImage = (UIImage *)zoom_image;
        [self layoutImageView];
    }else if ([zoom_image isKindOfClass:[NSString class]]) {
        [self setPath:(NSString *)zoom_image];
    }
}

- (void)setImageV:(CGRect)imageV{
    _imageV = imageV;
}
- (void)setWay:(PushWay)way{
    _way = way;
}

//网址加载图片
- (void)setPath:(NSString *)path {
    
    NSURL *URL = [NSURL URLWithString:path];
    
    [_imageView sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"默认图片"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        _currentImage = image;
        [self layoutImageView];
    }];

}
//自适应图片的宽高比
- (void)layoutImageView{
   __block CGRect imageFrame;
    if (_currentImage.size.width > self.bounds.size.width || _currentImage.size.height > self.bounds.size.height) {
        CGFloat imageRatio = _currentImage.size.width/_currentImage.size.height;
        CGFloat photoRatio = self.bounds.size.width/self.bounds.size.height;
        
        if (imageRatio > photoRatio) {
        
            switch (_way) {
                case PushVC:
                    imageFrame.size = CGSizeMake(self.bounds.size.width, self.bounds.size.width/_currentImage.size.width*_currentImage.size.height);
                    imageFrame.origin.x = 0;
                    imageFrame.origin.y = (self.bounds.size.height-imageFrame.size.height)/2.0;
                    break;
                case ZoomVC:
                {
                    imageFrame = _imageV;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [UIView animateWithDuration:0.2 animations:^{
                            imageFrame.size = CGSizeMake(self.bounds.size.width, self.bounds.size.width/_currentImage.size.width*_currentImage.size.height);
                            imageFrame.origin.x = 0;
                            imageFrame.origin.y = (self.bounds.size.height-imageFrame.size.height)/2.0;
                            _imageView.frame = imageFrame;
                            
                        }];
                        
                    });
                }

                    break;
                default:
                    break;
            }
            
        }else {
            imageFrame.size = CGSizeMake(self.bounds.size.height/_currentImage.size.height*_currentImage.size.width, self.bounds.size.height);
            imageFrame.origin.x = (self.bounds.size.width-imageFrame.size.width)/2.0;
            imageFrame.origin.y = 0;
        }
    }else {
        imageFrame.size = _currentImage.size;
        imageFrame.origin.x = (self.bounds.size.width-_currentImage.size.width)/2.0;
        imageFrame.origin.y = (self.bounds.size.height-_currentImage.size.height)/2.0;
    }
    
    
    _imageView.frame = imageFrame;
    _imageView.image = _currentImage;
    if (_images.count > 1) {
        [_imageView setAnimationImages:_images];
        [_imageView setAnimationDuration:_totalTime];
        [_imageView setAnimationRepeatCount:LONG_MAX];
        [_imageView startAnimating];
    }
}

#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGFloat offsetX = (self.bounds.size.width>self.contentSize.width)?(self.bounds.size.width-self.contentSize.width)*0.5:0.0;
    CGFloat offsetY = (self.bounds.size.height>self.contentSize.height)?(self.bounds.size.height-self.contentSize.height)*0.5:0.0;
    _imageView.center = CGPointMake(scrollView.contentSize.width*0.5+offsetX, scrollView.contentSize.height*0.5+offsetY);
}


#pragma mark -- 手势
//单击
- (void)singleClick:(UITapGestureRecognizer *)gestureRecognizer {
    
    if ([self.photo_delegate respondsToSelector:@selector(singleClickWithPhoto:photoImageView:)]) {
        _imageView.hidden = YES;
        self.hidden = YES;
        [self.photo_delegate singleClickWithPhoto:self photoImageView:_imageView];
    }
}

//双击
- (void)doubleClick:(UITapGestureRecognizer *)gestureRecognizer {
    
    if (self.zoomScale > MinScale) {
        [self setZoomScale:MinScale animated:YES];
    } else {
        CGPoint touchPoint = [gestureRecognizer locationInView:_imageView];
        CGFloat newZoomScale = self.maximumZoomScale;
        CGFloat xsize = self.frame.size.width/newZoomScale;
        CGFloat ysize = self.frame.size.height/newZoomScale;
        [self zoomToRect:CGRectMake(touchPoint.x-xsize/2, touchPoint.y-ysize/2, xsize, ysize) animated:YES];
    }
}

- (void)dealloc {
//    DLog(@"释放");
}

@end
