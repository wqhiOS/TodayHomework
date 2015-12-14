//
//  PictureCell.m
//  TodayHomework
//
//  Created by wuqh on 15/12/14.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "PictureCell.h"
#import <UIImageView+WebCache.h>
#import "THAPI.h"
#import "AttachmentInfoModel.h"
#import <SVProgressHUD.h>
#import <SDWebImageManager.h>
@interface PictureCell()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIImageView *_imageView;
}

@end

@implementation PictureCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.contentSize = self.bounds.size;
        _scrollView.minimumZoomScale = 1.0;
        _scrollView.maximumZoomScale = 5.0;
        _scrollView.delegate = self;
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [_scrollView addSubview:_imageView   ];
        [self.contentView addSubview:_scrollView];
    }
    return self;
}

- (void)setAttachmentInfo:(AttachmentInfoModel *)attachmentInfo {
    _attachmentInfo = attachmentInfo;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    static CGFloat progress;
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    BOOL isCached = [manager cachedImageExistsForURL:[NSURL URLWithString:[API_Picture stringByAppendingString:_attachmentInfo.storagePath ]]];
    DLog(@"是否有缓存:%d",isCached);
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:[API_Picture stringByAppendingString:_attachmentInfo.storagePath]]
                  placeholderImage:nil
                           options:SDWebImageRetryFailed|SDWebImageLowPriority
                          progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                              
                              
                           
                              progress = (CGFloat)receivedSize/(CGFloat)expectedSize;
                              if (progress == 1.0f ) {
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                      [SVProgressHUD dismiss];
                                  });
                                 
                              }else if(progress > 0.f) {
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                      [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
                                      [SVProgressHUD showProgress:progress status:@"loading"];
                                  });
                              }
                              
                              
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
//    __block UIProgressView *pv;
//    __weak UIImageView *weakImageView = _imageView;
//    [_imageView sd_setImageWithURL:[NSURL URLWithString:[API_Picture stringByAppendingString:_attachmentInfo.storagePath]]
//                placeholderImage:nil
//                         options:SDWebImageCacheMemoryOnly
//                        progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//                            if (!pv) {
//                                [weakImageView addSubview:pv = [UIProgressView.alloc initWithProgressViewStyle:UIProgressViewStyleDefault]];
//                                pv.frame = CGRectMake(0, 0, 100, 20);
//                                float showProgress = (float)receivedSize/(float)expectedSize;
//                                [pv setProgress:showProgress];
//                            } 
//                        } 
//                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) { 
//                           [pv removeFromSuperview]; 
//                           pv = nil; 
//                       }];
//    [_imageView sd_setImageWithURL:[NSURL URLWithString:[API_Picture stringByAppendingString:_attachmentInfo.storagePath]] placeholderImage:nil];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
    CGFloat xcenter = scrollView.center.x , ycenter = scrollView.center.y;
    
    xcenter = scrollView.contentSize.width > scrollView.frame.size.width ? scrollView.contentSize.width/2 : xcenter;
    
    ycenter = scrollView.contentSize.height > scrollView.frame.size.height ? scrollView.contentSize.height/2 : ycenter;
    
    _imageView.center = CGPointMake(xcenter, ycenter);
    
}



@end
