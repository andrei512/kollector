//
//  APTableSectionViewModel.h
//  kollector
//
//  Created by Andrei on 8/25/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APViewModel.h"
#import "APTableViewCellViewModel.h"

@interface APTableSectionViewModel : APViewModel

@property (nonatomic, strong) NSArray *cells;

- (int)numberOfCells;


@end
