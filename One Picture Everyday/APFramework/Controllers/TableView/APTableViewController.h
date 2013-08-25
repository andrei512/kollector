//
//  TableViewController.h
//  kollector
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APController.h"
#import "APTableSectionViewModel.h"
#import "APTableViewCellViewModel.h"
#import "APTableViewCell.h"

@interface APTableViewController : APController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UIViewController *viewController;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *sections;

- (int)numberOfSections;

- (void)registerAndRealoadTableView;

- (APTableViewCellViewModel *)cellViewModelAtIndexPath:(NSIndexPath *)indexPath;

@end
