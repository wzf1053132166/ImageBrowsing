//
//  PhotoZoomBrowser.m
//  TMC
//
//  Created by wzf on 2017/9/6.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "PhotoZoomBrowser.h"
#import "PhotoZoomCell.h"
#import "PhotoZoom.h"

@interface PhotoZoomBrowser ()<UICollectionViewDelegate,UICollectionViewDataSource,PhotoDelegate,UICollectionViewDelegateFlowLayout>{
    NSArray *_imageFrameArray;
    NSArray *_images;
    NSInteger _currentIndex;
    UICollectionView *_collectionView;
    UILabel *_titleLabel;
    PushWay _way;
    UIImageView *_resultImage;
}

@end

@implementation PhotoZoomBrowser

- (instancetype)initWithImages:(NSArray<UIImage *> *)images imageFrame:(NSArray<UIImageView *> *)imageFrame currentIndex:(NSInteger)currentIndex way:(PushWay)way {
    self = [super init];
    if (self) {
        _imageFrameArray = imageFrame;
        _images = images;
        _currentIndex = currentIndex;
        _way = way;
        self.view.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    }
    return self;
}



- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createViews];
}

- (void)createViews {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = YES;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[PhotoZoomCell class] forCellWithReuseIdentifier:@"cell_photo"];
    _collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collectionView];
    
    if (_currentIndex < _images.count) {
        [_collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:_currentIndex inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionLeft];
    }
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 70, [[UIScreen mainScreen] bounds].size.width, 30)];
    _titleLabel.text = [NSString stringWithFormat:@"%ld/%ld",_currentIndex+1,_images.count];
    if (_images.count == 1) {
        _titleLabel.hidden = YES;
    }
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_titleLabel];
    
    _resultImage = [[UIImageView alloc]init];
    [self.view addSubview:_resultImage];
    
}

#pragma mark - UICollectionViewDataSource
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.bounds.size;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoZoomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_photo" forIndexPath:indexPath];
    if (!cell.photo.photo_delegate) {
        cell.photo.photo_delegate = self;
    }
    UIImageView *image = [_imageFrameArray objectAtIndex:_currentIndex];
    cell.photo.imageV = image.frame;
    cell.photo.zoom_image = _images[indexPath.item];
    cell.photo.way = _way;
    cell.photo.zoomScale = 1.0;
    
    
    return cell;
}

#pragma mark - UICollectionViewDelagate 当图图片滑出屏幕外时，将图片比例重置为原始比例
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoZoomCell *LLCell = (PhotoZoomCell *)cell;
    LLCell.photo.zoomScale = 1.0;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _currentIndex = (long)scrollView.contentOffset.x/self.view.bounds.size.width;
    _titleLabel.text = [NSString stringWithFormat:@"%ld/%ld",_currentIndex+1,_images.count];
}

#pragma mark - LLPhotoDelegate 图片单击事件，显示/隐藏标题栏
- (void)singleClickWithPhoto:(PhotoZoom *)photo photoImageView:(UIImageView *)photoImageView {
    switch (_way) {
        case PushVC:
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        case ZoomVC:
        {
            self.view.backgroundColor = [UIColor clearColor];
            _resultImage.frame = photoImageView.frame;
            if ([photo.zoom_image isKindOfClass:[UIImage class]]) {
                _resultImage.image = (UIImage *)photo.zoom_image;
            }else if ([photo.zoom_image isKindOfClass:[NSString class]]) {
                [_resultImage sd_setImageWithURL:photo.zoom_image];
            }

            
            
            [_collectionView removeFromSuperview];
            [UIView animateWithDuration:0.2 animations:^{
                
                UIImageView *image = [_imageFrameArray objectAtIndex:_currentIndex];
                if (image != nil) {                    _resultImage.frame = image.frame;
                }
                [self backDelegate];
            } completion:^(BOOL finished) {
                [_resultImage removeFromSuperview];
                [self.view removeFromSuperview];
                [self removeFromParentViewController];
                
                
            }];
        }
            break;
        default:
            break;
    
    }
}


#pragma mark -- 返回代理
- (void)backDelegate {
    if ([self.delegate respondsToSelector:@selector(photoBrowser:didSelectImage:photoIndex:)]) {
        [self.delegate photoBrowser:self didSelectImage:_images[_currentIndex] photoIndex:_currentIndex];
    }
}

#pragma mark -- 隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _collectionView.frame = self.view.bounds;
    _collectionView.contentOffset = CGPointMake(self.view.bounds.size.width*_currentIndex, 0);
    [_collectionView reloadData];
    
}

- (void)dealloc {
    DLog(@"释放");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
