//
//  ViewModel.h
//  APFramework
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APModel.h"

@interface APViewModel : NSObject

// binds all the ViewModel properties to their respective Model properties
- (void)bindToModel:(APModel *)model;

// same as bindToModel: but does not bind the properties from doNotBind
- (void)bindToModel:(APModel *)model except:(NSArray *)doNotBind;

// binds all the Views properties to the ViewModel properties
- (void)bindView:(UIView *)view;

// same as bindView: but does not bind the properties from doNotBind
- (void)bindView:(UIView *)view except:(NSArray *)doNotBind;

@end
