//
//  NSObject+APLisp.h
//  kollector
//
//  Created by Andrei on 9/5/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>

// Core

#define c0ntext [NSObject _context]

#define this c0ntext[@"this"]
    #define as(Class) Class *object = (Class)this;

#define params c0ntext[@"params"]
#define param c0ntext[@"param"]

#define do(block) [self performBlock:block];

#define resu1t c0ntext[@"lastResult"]

#define ret(a_result) [NSObject _ret:a_result]; return;


// Constants

#define nsnull [NSNull null]

// Helpers

// Array

#define kollect(array, block) \
[array map:^id(id object) { PO(c0ntext) [object performBlock:block]; PO(resu1t) return resu1t; }]



// Hash

typedef void(^ThisBlock)(void);

@interface NSObject (APLisp)

+ (NSMutableArray *)stackForCurrentThread;

+ (NSMutableDictionary *)_context;

+ (void)_ret:(id)a_result;

- (void)performBlock:(id)block;
- (void)performBlock:(id)block withParam:(id)_param;
- (void)performBlock:(id)block with:(NSArray *)_params;


@end