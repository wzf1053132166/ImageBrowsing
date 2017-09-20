# ImageBrowsing
九宫格图片浏览器，DES3加密解密，自定义可点击消除MBProgressHUD,FMDB缓存，Masonry基本用法


用法：

- (void)viewDidLoad {

    
    [super viewDidLoad];
    _images = @[@"http://oopas6scq.bkt.clouddn.com/image/wzry_libai.jpeg",
                @"http://oopas6scq.bkt.clouddn.com/image/wzry_libai.jpeg",
                @"http://oopas6scq.bkt.clouddn.com/image/wzry_libai.jpeg",
                @"http://oopas6scq.bkt.clouddn.com/image/huanyingguanglin.gif",
                [UIImage imageNamed:@"1.jpg"],
                @"http://oopas6scq.bkt.clouddn.com/image/huanyingguanglin.gif",
                @"http://oopas6scq.bkt.clouddn.com/image/wzry_libai.jpeg",
                @"http://oopas6scq.bkt.clouddn.com/image/wzry_libai.jpeg"];
                
    array = [NSMutableArray array];
    
    for (int i = 0; i<_images.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        
        if ([_images[i] isKindOfClass:[UIImage class]]) {
            imageView.image = (UIImage *)_images[i];
        }else if ([_images[i] isKindOfClass:[NSString class]]) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:_images[i]] placeholderImage:nil];
        }
        
        
        [self.view addSubview:imageView];
        
        NSInteger row = i / COL_COUNT;
        
        NSInteger col = i % COL_COUNT;
        
        CGFloat margin = (self.view.bounds.size.width - (PIC_WIDTH * COL_COUNT)) / (COL_COUNT + 1);
        
        CGFloat picX = margin + (PIC_WIDTH + margin) * col;
        
        CGFloat picY = margin + (PIC_HEIGHT + margin) * row;
        
        imageView.frame = CGRectMake(picX,100 + picY, PIC_WIDTH, PIC_HEIGHT);
        [array addObject:imageView];
        imageView.tag = 100 + i;
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tag:)];
        [imageView addGestureRecognizer:tag];
        
    }

}



- (void)tag:(UITapGestureRecognizer *)gestureRecognizer {
   
   
    NSInteger index = gestureRecognizer.view.tag - 100;
    PhotoZoomBrowser *photoBrowser = [[PhotoZoomBrowser alloc] initWithImages:_images imageFrame:array currentIndex:index way:ZoomVC];
    photoBrowser.delegate = self;
    photoBrowser.hidesBottomBarWhenPushed = YES;
    [self addChildViewController:photoBrowser];
    [self.view addSubview:photoBrowser.view];
    MyAppDelegate.mainTabbarVC.tabBar.hidden = YES;
    
    
}

- (IBAction)buttonWithTag:(id)sender {
    
    PhotoZoomBrowser *photoBrowser = [[PhotoZoomBrowser alloc] initWithImages:_images imageFrame:array currentIndex:4 way:PushVC];
    photoBrowser.delegate = self;
    [MyAppDelegate.window.rootViewController presentViewController:photoBrowser animated:YES completion:nil];
}


- (void)photoBrowser:(PhotoZoomBrowser *)photoBrowser didSelectImage:(id)image photoIndex:(NSInteger)photoIndex{
    
    MyAppDelegate.mainTabbarVC.tabBar.hidden = NO;
    
}
