//
//  NSObject+APLisp.m
//  kollector
//
//  Created by Andrei on 9/5/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "NSObject+APLisp.h"

@implementation NSObject (APLisp)

+ (NSMutableArray *)stackForCurrentThread {
    NSThread *thread = [NSThread currentThread];
    NSMutableDictionary *dict = [thread threadDictionary];
    if (dict[@"thisStack"] == nil) {
        NSMutableDictionary *rootContextForThread = [NSMutableDictionary dictionary];
        dict[@"thisStack"] = [NSMutableArray arrayWithObject:rootContextForThread];
    }
    return dict[@"thisStack"];
}

+ (NSMutableDictionary *)_context {
    return [[NSObject stackForCurrentThread] lastObject];
}

- (void)pushContext {
    [[NSObject stackForCurrentThread] addObject:[NSMutableDictionary dictionary]];
}

- (void)popContext {
    [[NSObject stackForCurrentThread] removeLastObject];
}

- (void)performBlock:(id)block {
    [self performBlock:block with:nil];
}

- (void)performBlock:(id)block withParam:(id)_param {
    [self performBlock:block with:@[_param]];
}

- (void)performBlock:(id)block with:(NSArray *)_params {
    @try {
        ThisBlock thisBlock = (ThisBlock)block;
        if (thisBlock != nil) {
            [self pushContext];
            
            this = self;
            params = _params ?: @[];
            param = (_params != nil && _params.count > 0) ? _params[0] : nsnull;
            [NSObject _ret:self];
            
            thisBlock();
            [self popContext];
        }

    }
    @catch (NSException *exception) {
        [[NSException exceptionWithName:@"Throw stack"
                                reason:@"block chrashed"
                              userInfo:@{}] raise];
    }
}

+ (void)_ret:(id)a_result {
    NSMutableArray *stack = [NSObject stackForCurrentThread];
    int level = stack.count;
    if (level > 1) {
        NSMutableDictionary *superContext = stack[level - 2];
        superContext[@"lastResult"] = a_result;
    }
}



@end
