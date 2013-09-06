//
//  ViewController.m
//  kollector
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APViewController.h"

@interface APViewController ()

@end

@implementation APViewController

+ (instancetype)viewController {
    NSString *nibName = self.className;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSString *iPadPath = [[NSBundle mainBundle]
                              pathForResource:[nibName stringByAppendingString:@"_iPad"]
                              ofType:@"nib"];
        if (iPadPath != nil) {
            nibName = [nibName stringByAppendingString:@"_iPad"];
        }
    } else {
        NSString *iPhonePath = [[NSBundle mainBundle]
                                pathForResource:[nibName stringByAppendingString:@"_iPhone"]
                                ofType:@"nib"];
        if (iPhonePath != nil) {
            nibName = [nibName stringByAppendingString:@"_iPhone"];
        }
    }
    
    NSString *nibPath = [[NSBundle mainBundle]
                            pathForResource:nibName
                            ofType:@"nib"];
    
    APViewController *viewController = nil;
    if (nibPath != nil) {
        viewController = [[self alloc] initWithNibName:nibName bundle:nil];
    } else {
        NSLog(@"did not found nib named %@ for %@", nibName, self.className);
        viewController = [[self alloc] initWithNibName:nil bundle:nil];
    }
    
    return viewController;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.controllers = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Controllers And Transitions

- (void)addController:(APController *)controller {
    [self addController:controller animated:NO];
}

- (void)removeController:(APController *)controller {
    [self removeController:controller animated:NO];
}

- (void)addController:(APController *)controller animated:(BOOL)animated {
    if (animated) {
        [self addController:controller
             withTransition:[APControllerTransition FadeTransition]];
    } else {
        [self addController:controller
             withTransition:[APControllerTransition NonAnimatedTransition]];
    }
}

- (void)removeController:(APController *)controller animated:(BOOL)animated {
    if (animated) {
        [self removeController:controller
             withTransition:[APControllerTransition FadeTransition]];
    } else {
        [self removeController:controller
             withTransition:[APControllerTransition NonAnimatedTransition]];
    }    
}

- (void)addController:(APController *)controller withTransition:(APControllerTransition *)transition {
    [self.controllers addObject:controller];
    controller.viewController = self;

    [transition add:controller to:self];
}

- (void)removeController:(APController *)controller withTransition:(APControllerTransition *)transition {
    controller.viewController = nil;
    [self.controllers removeObject:controller];

    [transition remove:controller from:self];
}




@end
