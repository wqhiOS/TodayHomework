//
//  PictureCell.m
//  TodayHomework
//
//  Created by wuqh on 15/12/14.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "PictureCell.h"
#import "UIImageView+WebCache.h"
#import "THAPI.h"
#import "SVProgressHUD.h"

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
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_scrollView addSubview:_imageView];
        [self.contentView addSubview:_scrollView];
        
    }
    return self;
}

- (void)setAttachmentInfo:(AttachmentInfoModel *)attachmentInfo {
    _attachmentInfo = attachmentInfo;
    
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:[API_Picture stringByAppendingString:attachmentInfo.storagePath]] placeholderImage:nil options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
       
        CGFloat progress = (CGFloat)receivedSize/(CGFloat)expectedSize;
        if (progress == 1) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            
        }else {
            dispatch_async(dispatch_get_main_queue(), ^{
               [SVProgressHUD showProgress:progress status:@"loading"];
            });
        }
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    CGFloat xcenter = scrollView.center.x , ycenter = scrollView.center.y;
    
    xcenter = scrollView.contentSize.width > scrollView.frame.size.width ? scrollView.contentSize.width/2 : xcenter;
    
    ycenter = scrollView.contentSize.height > scrollView.frame.size.height ? scrollView.contentSize.height/2 : ycenter;
    
    _imageView.center = CGPointMake(xcenter, ycenter);
}

@end
