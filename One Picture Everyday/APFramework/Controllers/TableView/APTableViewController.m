//
//  TableViewController.m
//  kollector
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APTableViewController.h"

@implementation APTableViewController


- (void)realoadTableView {
    [self normalizeData];
    
    NSMutableSet *cellNibNames = [NSMutableSet set];
    for (APTableSectionViewModel *section in self.sections) {
        for (APTableCellViewModel *cell in section.cells) {
            [cellNibNames addObject:cell.cellIdentifier];
            if (cell.viewController == nil) {
                cell.viewController = self.viewController;
            }
            if (cell.tableView == nil) {
                cell.tableView = self.tableView;
            }
        }
    }
    NSMutableDictionary *nibStash = [self instanceStashWithKey:@"nibStash"];
    
    for (NSString *cellNibName in cellNibNames) {
        if (nibStash[cellNibName] == nil) {
            nibStash[cellNibName] = [UINib nibWithNibName:cellNibName bundle:nil];
            [self.tableView registerNib:nibStash[cellNibName]
                 forCellReuseIdentifier:cellNibName];
        }
    }
    
    [self.tableView reloadData];
}

- (int)numberOfSections {
    return self.sections.count;
}

- (APTableCellViewModel *)cellViewModelAtIndexPath:(NSIndexPath *)indexPath {
    APTableSectionViewModel *section = self.sections[indexPath.section];
    return section.cells[indexPath.row];
}

#pragma mark - Magic

- (void)normalizeData {
    // TO DO: figure out how to run this code just once or smth..
    self.sections = [self.sections map:^id(id section) {
        if ([section isKindOfClass:[APTableSectionViewModel class]] == YES) {
            // is real section model
            APTableSectionViewModel *normalSection = section;
            [normalSection normalizeData];
            return normalSection;
        } else if ([section isKindOfClass:[NSArray class]] == YES){
            // is in fact a array of unnormalized data
            APTableSectionViewModel *arraySection = [APTableSectionViewModel sectionWithCells:(NSArray *)section];
            [arraySection normalizeData];
            return arraySection;
        } else {
            // ignore the fact that you don't have a section model or an array of cellModels
            // and just make a Section with one cell containing the object
            APTableSectionViewModel *wierdSection = [APTableSectionViewModel sectionWithCells:@[section]];
            [wierdSection normalizeData];
            return wierdSection;
        }
    }];
}


#pragma mark - UITableViewDataSource

- (int)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.numberOfSections;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
    APTableSectionViewModel *section = self.sections[sectionIndex];
    return section.numberOfCells;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    APTableCellViewModel *cellViewModel = [self cellViewModelAtIndexPath:indexPath];
    
    APTableCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellViewModel.cellIdentifier];
    
    [cell loadViewModel:cellViewModel];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    APTableCellViewModel *cellViewModel = [self cellViewModelAtIndexPath:indexPath];
    if (cellViewModel.onSelect != nil) {
        cellViewModel.onSelect();
    }
}

@end
