//
//  PictureCollectionViewCell.m
//  kollector
//
//  Created by Andrei on 8/27/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "PictureCollectionViewCell.h"

@implementation PictureCollectionViewCell

- (void)loadPictureFromURL:(NSString *)urlString {
    static UIImage *placeholder = nil;
    if (placeholder == nil) {
        placeholder = [UIImage imageNamed:@"loading"];
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    [self.imageView setImageWithURL:url placeholderImage:placeholder];
}
@end
