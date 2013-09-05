//
//  APControllerTransition.m
//  kollector
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APControllerTransition.h"

@implementation APControllerTransition

+ (instancetype)transitionWithAdd:(AddControllerBlock)add andRemove:(RemoveControllerBlock)remove {
    APControllerTransition *transition = [self new];
    transition.add = add;
    transition.remove = remove;
    return transition;
}

+ (instancetype)transitionWithAdd:(AddControllerBlock)add {
    return [self transitionWithAdd:add andRemove:nil];
}

+ (instancetype)transitionWithRemove:(RemoveControllerBlock)remove {
    return [self transitionWithAdd:nil andRemove:remove];
}

- (void)add:(APController *)controller to:(APViewController *)viewController {
    if (self.add) {
        self.add(controller, viewController);
    }
}

- (void)remove:(APController *)controller from:(APViewController *)viewController {
    if (self.remove != nil) {
        self.remove(controller, viewController);
    }
}

+ (instancetype)NonAnimatedTransition {
    return [self transitionWithAdd:^(APController *controller, APViewController *viewController) {
        [viewController.view addSubview:controller.view];
    } andRemove:^(APController *controller, APViewController *viewController) {
        [controller.view removeFromSuperview];
    }];
}

+ (instancetype)FadeTransition {
    return [self transitionWithAdd:^(APController *controller, APViewController *viewController) {
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

+ (instancetype)SnapControllerView {
    return [self transitionWithAdd:^(APController *controller, APViewController *viewController) {
        controller.view.frame = viewController.view.bounds;
    }];
}

- (APControllerTransition *)chainedWith:(APControllerTransition *)transition {
    return [APControllerTransition transitionWithAdd:^(APController *controller, APViewController *viewController) {
        self.add(controller, viewController);
        transition.add(controller, viewController);
    } andRemove:^(APController *controller, APViewController *viewController) {
        self.remove(controller, viewController);
        transition.remove(controller, viewController);
    }];
}

@end
