//
//  ViewController.h
//  kollector
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APController.h"
#import "APControllerTranzition.h"

typedef void(^APDialogCallback)(int index);

@interface APViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *controllers;

- (void)addController:(APController *)controller;
- (void)removeController:(APController *)controller;

- (void)addController:(APController *)controller animated:(BOOL)animated;
- (void)removeController:(APController *)controller animated:(BOOL)animated;

- (void)addController:(APController *)controller withTranzition:(APControllerTranzition *)tranzition;
- (void)removeController:(APController *)controller withTranzition:(APControllerTranzition *)tranzition;

- (void)alert:(NSString *)message;
- (void)error:(NSString *)message;
- (void)error:(NSString *)message withOptions:(NSArray *)options callback:(APDialogCallback)callback;
- (void)dialog:(NSString *)message withOptions:(NSArray *)options callback:(APDialogCallback)callback;
- (void)dialog:(NSString *)message withOptions:(NSArray *)options andTitle:(NSString *)title callback:(APDialogCallback)callback;

- (void)showBottonMessage:(NSString *)message;
- (void)showTopMessage:(NSString *)message;


@end
