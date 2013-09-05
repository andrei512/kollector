//
//  MainViewController.m
//  kollector
//
//  Created by Andrei Puni on 8/28/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "MainViewController.h"

#import "APTableController.h"

@interface MainViewController ()

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Main";

    APTableController *tableController = [APTableController controllerForViewController:self];

    APTableCellViewModel *firstCell = [APTableCellViewModel cellModel];
    firstCell.object = @"first";
    firstCell.onLoad = ^(APTableCell *cell) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    };
    firstCell.onSelect = ^{
        MainViewController *vc = [MainViewController viewController];
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    tableController.sections = @[
        firstCell,
        @{
            kObject : @"ana",
            kOnSelect : ^{
                [self.navigationController popViewControllerAnimated:YES];
            }
        },
        @[@"are", @"multe"],
        @{
            kObject : @"mere",
            kOnLoad : ^(APTableCell *cell) {
                cell.textLabel.textColor = [UIColor redColor];
            }
        }
    ];

    [self addController:tableController withTranzition:[APControllerTranzition FadeTranzition]];
    
    [tableController realoadTableView];
}


@end
