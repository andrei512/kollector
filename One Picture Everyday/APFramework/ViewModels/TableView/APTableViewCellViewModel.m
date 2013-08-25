//
//  APTableViewCellModel.m
//  kollector
//
//  Created by Andrei on 8/25/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APTableViewCellViewModel.h"

@implementation APTableViewCellViewModel

- (void)setup {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        self.cellIdentifier = [[self className] stringByRemovingSuffix:@"ViewModel"];
    });
}

- (id)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

@end
