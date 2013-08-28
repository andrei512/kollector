//
//  Controller.h
//  kollector
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class APViewController;

@interface APController : NSObject

@property (nonatomic, weak) IBOutlet APViewController *viewController;

// main view for controller
@property (nonatomic, weak) IBOutlet UIView *view;

+ (instancetype)controller;
+ (instancetype)controllerForViewController:(APViewController *)viewController;

@end
