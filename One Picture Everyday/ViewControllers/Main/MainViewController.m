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
    
    APTableViewCellActionBlock makeTextRed = ^(APTableCell *cell) {
        cell.textLabel.textColor = [UIColor redColor];
        CGRect frame = cell.frame;
        frame.size.height = 100;
        cell.frame = frame;
    };
    
    tableController.sections = @[
                                 @{
                                     kObject : @"ana",
                                     kOnSelect : ^{
                                         PO(@"YOU TAPPED ANA ;)")
                                     },
                                     kOnLoad : makeTextRed
                                     },
                                 @[
                                     @"are",
                                     @{
                                         kObject : @"multe",
                                         kOnLoad : makeTextRed
                                         }
                                     ],
                                 @"mere",
    ];

    
    
    
    [self addController:tableController
         withTransition:[[APControllerTransition SnapControllerView]
                         chainedWith:[APControllerTransition FadeTransition]]
     ];
    
    [tableController realoadTableView];
    
    [tableController performBlockwithParams:@[@"hello"]
                    onContextKey:@"^.*view$"
                           block:^{
                               PO(this)
                           }];
}


@end
