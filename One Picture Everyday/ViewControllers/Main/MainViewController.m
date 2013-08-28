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

    APTableController *tableController = [APTableController controllerForViewController:self];
    
    NSMutableArray *cellModels = [NSMutableArray array];
    
    for (int i = 0; i < 100; ++i) {
        APTableCellViewModel *cellModel = [APTableCellViewModel cellModel];
        
        cellModel.onLoad = ^(APTableCell *cell) {
            cell.textLabel.text = [NSString stringWithFormat:@"#%d", i];
        };
        
        cellModel.onSelect = ^{
            NSLog(@"tapped cell #%d", i);            
        };
        
        [cellModels addObject:cellModel];
    }
    
    tableController.sections = @[[APTableSectionViewModel sectionWithCells:cellModels]];
    tableController.sections = @[@"ana", @"are", @"mere"];
    
    [self addController:tableController];
    
    [tableController realoadTableView];
}


@end
