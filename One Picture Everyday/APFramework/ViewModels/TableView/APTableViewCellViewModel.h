//
//  APTableViewCellModel.h
//  kollector
//
//  Created by Andrei on 8/25/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APViewModel.h"

@interface APTableViewCellViewModel : APViewModel

@property (nonatomic, weak) APViewController *viewController;
@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSString *cellIdentifier;



@end
