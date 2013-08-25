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
        viewController = [[APViewController alloc] initWithNibName:nibName bundle:nil];
    } else {
        NSLog(@"did not found nib named %@ for %@", nibName, self.className);
        viewController = [[APViewController alloc] initWithNibName:nil bundle:nil];
    }
    
    return viewController;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
