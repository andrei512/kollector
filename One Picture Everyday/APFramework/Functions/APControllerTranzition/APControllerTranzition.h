//
//  APControllerTranzition.h
//  kollector
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APFunction.h"

@class APViewController;
@class APController;

@interface APControllerTranzition : APFunction

+ (void)add:(APController *)controller to:(APViewController *)viewController;
+ (void)remove:(APController *)controller from:(APViewController *)viewController;

@end
