//
//  APTableViewCellModel.m
//  kollector
//
//  Created by Andrei on 8/25/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APTableCellViewModel.h"

@implementation APTableCellViewModel

- (id)init {
    if (self = [super init]) {
        self.cellIdentifier = [[self className] stringByRemovingSuffix:@"ViewModel"];
    }
    return self;
}

+ (instancetype)cellModel {
    return [self new];
}

@end
