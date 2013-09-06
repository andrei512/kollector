//
//  CollectionViewController.h
//  APFramework
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APController.h"

@interface APCollectionViewController : APController

@property (nonatomic, strong) NSArray *sections;

+ (instancetype)controllerWithSections:(NSArray *)sections;
+ (instancetype)controllerWithCells:(NSArray *)cells;

- (void)registerAndReload;

@end
