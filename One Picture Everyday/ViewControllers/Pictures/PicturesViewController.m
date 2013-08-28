//
//  PicturesViewController.m
//  kollector
//
//  Created by Andrei on 8/27/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "PicturesViewController.h"
#import "PictureCollectionViewCell.h"

@interface PicturesViewController ()

@end

@implementation PicturesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pictures = @[];
    for (int i = 0; i < 100; ++i) {
        self.pictures = [self.pictures arrayByAddingObject:@"http://i.imgur.com/uOUSG6O.jpg"];
    }
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"PictureCollectionViewCell"
                                                    bundle:nil]
          forCellWithReuseIdentifier:@"picture"];
}

#pragma mark - Actions

- (IBAction)didTapTakePicture:(UIButton *)button {
    self.pictures = [@[@"http://i.imgur.com/UErG3ap.jpg"]
         arrayByAddingObjectsFromArray:self.pictures];
    [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
}

#pragma mark - UICollectionViewDelegate 

#pragma mark - UICollectionViewDataSource 

- (int)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (int)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.pictures.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"picture"
                                                                                forIndexPath:indexPath];
    
    
    [cell loadPictureFromURL:self.pictures[indexPath.row]];
    
    return cell;
}

@end











