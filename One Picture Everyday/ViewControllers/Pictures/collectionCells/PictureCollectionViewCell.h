//
//  PictureCollectionViewCell.h
//  kollector
//
//  Created by Andrei on 8/27/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>

@interface PictureCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

- (void)loadPictureFromURL:(NSString *)url;

@end
