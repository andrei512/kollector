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

typedef void(^AddControllerBlock)(APController *controller, APViewController *viewController);
typedef void(^RemoveControllerBlock)(APController *controller, APViewController *viewController);

@interface APControllerTranzition : APFunction

@property (nonatomic, copy) AddControllerBlock add;
@property (nonatomic, copy) RemoveControllerBlock remove;

+ (instancetype)tranzitionWithAdd:(AddControllerBlock)add andRemove:(RemoveControllerBlock)remove;
+ (instancetype)tranzitionWithAdd:(AddControllerBlock)add;
+ (instancetype)tranzitionWithRemove:(RemoveControllerBlock)remove;

- (void)add:(APController *)controller to:(APViewController *)viewController;
- (void)remove:(APController *)controller from:(APViewController *)viewController;

+ (instancetype)NonAnimatedTranzition;
+ (instancetype)FadeTranzition;


@end
