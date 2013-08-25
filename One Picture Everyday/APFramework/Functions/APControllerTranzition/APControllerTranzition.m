//
//  APControllerTranzition.m
//  kollector
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APControllerTranzition.h"

@implementation APControllerTranzition

+ (instancetype)tranzitionWithAdd:(AddControllerBlock)add andRemove:(RemoveControllerBlock)remove {
    APControllerTranzition *tranzition = [self new];
    tranzition.add = add;
    tranzition.remove = remove;
    return tranzition;
}

+ (instancetype)tranzitionWithAdd:(AddControllerBlock)add {
    return [self tranzitionWithAdd:add andRemove:nil];
}

+ (instancetype)tranzitionWithRemove:(RemoveControllerBlock)remove {
    return [self tranzitionWithAdd:nil andRemove:remove];
}

- (void)add:(APController *)controller to:(APViewController *)viewController {
    self.add(controller, viewController);
}

- (void)remove:(APController *)controller from:(APViewController *)viewController {
    self.remove(controller, viewController);    
}

+ (instancetype)NonAnimatedTranzition {
    return [self tranzitionWithAdd:^(APController *controller, APViewController *viewController) {
        [viewController.view addSubview:controller.view];
    } andRemove:^(APController *controller, APViewController *viewController) {
        [controller.view removeFromSuperview];
    }];
}

+ (instancetype)FadeTranzition {
    return [self tranzitionWithAdd:^(APController *controller, APViewController *viewController) {
        controller.view.alpha = 0;
        [viewController.view addSubview:controller.view];
        [UIView animateWithDuration:0.3
                         animations:^{
                             controller.view.alpha = 1;
                         }];
    } andRemove:^(APController *controller, APViewController *viewController) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             controller.view.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             [controller.view removeFromSuperview];
                         }];
    }];
}


@end
