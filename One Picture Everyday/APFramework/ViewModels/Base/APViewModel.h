//
//  ViewModel.h
//  kollector
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APModel.h"

@interface APViewModel : NSObject

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) APModel *model;

@end
