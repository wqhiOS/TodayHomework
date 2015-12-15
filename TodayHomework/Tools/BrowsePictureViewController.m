//
//  BrowsePictureViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/12/14.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BrowsePictureViewController.h"
#import "PictureCell.h"

@interface BrowsePictureViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSArray *_attachmentInfos;
    NSInteger _index;
}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UILabel *indexLabel;

@end

@implementation BrowsePictureViewController

- (instancetype)initWithAttachmentInfos:(NSArray *)attachmentInfos index:(NSInteger)index{
    if (self = [super init]) {
        _attachmentInfos = attachmentInfos;
        _index = index;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.indexLabel];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.isCanTapCloseKeyBoard = NO;
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_index inSection:0] atScrollPosition:0 animated:NO];
    self.indexLabel.text =[NSString stringWithFormat:@"%ld/%ld",_index+1,_attachmentInfos.count];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated  ];
//    self.navigationController.hidesBarsOnSwipe = YES;
    self.navigationController.hidesBarsOnTap = YES;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated   ];
    self.navigationController.hidesBarsOnTap = NO;
//    self.navigationController.hidesBarsOnSwipe = NO;
}



#pragma mark - getter
- (UILabel *)indexLabel {
    if (!_indexLabel) {
        _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-100, 80, 30)];
        _indexLabel.backgroundColor = [UIColor clearColor];
        _indexLabel.textColor = [UIColor whiteColor];
        _indexLabel.font = [UIFont boldSystemFontOfSize:17];
    }
    return _indexLabel;
}

static NSString *cellId = @"cellId";
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
        [_collectionView registerClass:[PictureCell class] forCellWithReuseIdentifier:cellId];
        _collectionView.pagingEnabled = YES;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _attachmentInfos.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PictureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.attachmentInfo = _attachmentInfos[indexPath.row];
    return cell;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / SCREEN_WIDTH;
    self.indexLabel.text = [NSString stringWithFormat:@"%ld/%ld",index+1,_attachmentInfos.count];
}



@end
