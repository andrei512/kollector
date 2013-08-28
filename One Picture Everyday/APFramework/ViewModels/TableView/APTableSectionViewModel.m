//
//  APTableSectionViewModel.m
//  kollector
//
//  Created by Andrei on 8/25/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APTableSectionViewModel.h"

@implementation APTableSectionViewModel

+ (instancetype)sectionWithCells:(NSArray *)cells {
    APTableSectionViewModel *section = [self new];
    
    section.cells = cells;
    
    return section;
}

- (int)numberOfCells {
    return self.cells.count;
}

@end
