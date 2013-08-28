//
//  APTableViewCellModel.h
//  kollector
//
//  Created by Andrei on 8/25/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APViewModel.h"
#import "APTableCell.h"

typedef void(^APTableViewCellActionBlock)(APTableCell *);
typedef void(^APTableViewActionBlock)(void);

@interface APTableCellViewModel : APViewModel

@property (nonatomic, weak) APViewController *viewController;
@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSString *cellIdentifier;

// blocks and magic

@property (nonatomic, copy) APTableViewCellActionBlock onLoad;
@property (nonatomic, copy) APTableViewActionBlock onSelect;

+ (instancetype)cellModel;

@end
