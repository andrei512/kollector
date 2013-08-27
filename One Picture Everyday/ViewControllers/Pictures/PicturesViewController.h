//
//  PicturesViewController.h
//  kollector
//
//  Created by Andrei on 8/27/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APViewController.h"

@interface PicturesViewController : APViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *pictures;

- (IBAction)didTapTakePicture:(UIButton *)button;

@end
