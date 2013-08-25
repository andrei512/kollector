//
//  Controller.m
//  kollector
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APController.h"
#import "APViewController.h"

@implementation APController

+ (instancetype)controller {
    return [self new];
}

+ (instancetype)controllerForViewController:(APViewController *)viewController {
    NSString *nibName = self.className;
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    NSArray *objects = [nib instantiateWithOwner:viewController options:nil];
    for (NSObject *object in objects) {
        if ([object isKindOfClass:[self class]]) {
            return (APController *)object;
        }
    }
    return nil;
}


@end
