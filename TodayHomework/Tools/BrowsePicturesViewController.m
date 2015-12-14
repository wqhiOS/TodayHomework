//
//  BrowsePicturesViewController.m
//  TodayHomework
//
//  Created by wuqh on 15/12/9.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BrowsePicturesViewController.h"
#import "PictureCell.h"

@interface BrowsePicturesViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *attachmentInfos;

@end

@implementation BrowsePicturesViewController

- (instancetype)initWithAttachmentInfos:(NSArray *)attachmentsInfos {
    if (self = [super init]) {
        _attachmentInfos = attachmentsInfos;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.collectionView];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.hidesBarsOnTap = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.hidesBarsOnTap = NO;
}
#pragma mark - getter
static NSString *cellId = @"cellId";
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = self.view.bounds.size;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[PictureCell class] forCellWithReuseIdentifier:cellId];
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.attachmentInfos.count;
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PictureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.attachmentInfo = self.attachmentInfos[indexPath.row];
    return cell;
}

@end
