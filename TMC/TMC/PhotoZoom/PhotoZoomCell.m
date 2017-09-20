//
//  PhotoZoomCell.m
//  TMC
//
//  Created by wzf on 2017/9/6.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "PhotoZoomCell.h"

@implementation PhotoZoomCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        CGRect rect = self.bounds;
        rect.size.width -= 10;
        rect.origin.x = 5;
        _photo = [[PhotoZoom alloc] initWithFrame:rect];
        _photo.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self addSubview:_photo];
    }
    return self;
}

- (void)layoutSubviews {
    _photo.zoomScale = 1.0;
    _photo.contentSize = _photo.bounds.size;
}


@end
