//
//  APControllerTransition.h
//  kollector
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "APFunction.h"

@class APViewController;
@class APController;

typedef void(^AddControllerBlock)(APController *controller, APViewController *viewController);
typedef void(^RemoveControllerBlock)(APController *controller, APViewController *viewController);

@interface APControllerTransition : APFunction

@property (nonatomic, copy) AddControllerBlock add;
@property (nonatomic, copy) RemoveControllerBlock remove;

+ (instancetype)transitionWithAdd:(AddControllerBlock)add andRemove:(RemoveControllerBlock)remove;
+ (instancetype)transitionWithAdd:(AddControllerBlock)add;
+ (instancetype)transitionWithRemove:(RemoveControllerBlock)remove;

- (void)add:(APController *)controller to:(APViewController *)viewController;
- (void)remove:(APController *)controller from:(APViewController *)viewController;

+ (instancetype)NonAnimatedTransition;
+ (instancetype)FadeTransition;

/**
 *
 *
 *  @return a APControllerTransition that makes the controllers view as big as the viewController's view
 */
+ (instancetype)SnapControllerView;

- (APControllerTransition *)chainedWith:(APControllerTransition *)transition;

@end
