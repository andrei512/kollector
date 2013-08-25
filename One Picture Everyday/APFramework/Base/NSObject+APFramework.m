//
//  NSObject+APFramework.m
//  kollector
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import "NSObject+APFramework.h"

@implementation NSObject (APFramework)


+ (NSString *)className {
    return NSStringFromClass([self class]);
}

- (NSString *)className {
    return NSStringFromClass([self class]);
}

+ (instancetype)sharedInstance {
    static NSMutableDictionary *singletonStash = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singletonStash = [NSMutableDictionary dictionary];
    });
    if (singletonStash[self.className] == nil) {
        singletonStash[self.className] = [self new];
    }
    return singletonStash[self.className];
}

+ (NSMutableDictionary *)stashWithKey:(NSString *)name {
    static NSMutableDictionary *metaStash = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        metaStash = [NSMutableDictionary dictionary];
    });
    if (metaStash[name] == nil) {
        metaStash[name] = [NSMutableDictionary dictionary];
    }    
    return metaStash[name];
}

+ (NSMutableDictionary *)globalStashWithKey:(NSString *)key {
    return [self stashWithKey:key];
}

+ (NSMutableDictionary *)classStashWithKey:(NSString *)key {
    return [self stashWithKey:[NSString stringWithFormat:@"%@.%@", self.className, key]];
}

- (NSMutableDictionary *)globalStashWithKey:(NSString *)key {
    return [[self class] globalStashWithKey:key];
}

- (NSMutableDictionary *)classStashWithKey:(NSString *)key {
    return [[self class] classStashWithKey:key];
}

- (NSMutableDictionary *)instanceStashWithKey:(NSString *)key {
    return [[self class] stashWithKey:[NSString stringWithFormat:@"%d.%@", (int)self, key]];
}

#define kLoadStashBlock @"kLoadStashBlock"
+ (id)load:(StashBlock)block forKey:(NSString *)key {
    if ([self stashWithKey:key][kLoadStashBlock] == nil) {
        [self stashWithKey:key][kLoadStashBlock] = block();
    }
    return [self stashWithKey:key];
}

- (id)load:(StashBlock)block forKey:(NSString *)key {
    return [[self class] load:block forKey:key];
}

+ (NSDictionary *)config {
    return [self load:^{
        return @{};
    }
               forKey:UNIQUE_KEY [NSString stringWithFormat:@"%s%d", __PRETTY_FUNCTION__, __LINE__]];
}

+ (id)$:(NSString *)key {
    return [self config][key];
}

- (id)$:(NSString *)key {
    return [[self class] $:key];
}

#pragma mark - Keys

- (KeyBlock)instanceKey {
    __block NSObject *selfb = self;
    return ^(NSString *key) {
        return [NSString stringWithFormat:@"%d.%@", (int)selfb, key];
    };
}

- (KeyBlock)classKey {
    __block NSObject *selfb = self;
    return ^(NSString *key) {
        return [NSString stringWithFormat:@"%@.%@", selfb.className, key];
    };
}

+ (KeyBlock)classKey {
    __block NSString *className = self.className;
    return ^(NSString *key) {
        return [NSString stringWithFormat:@"%@.%@", className, key];
    };
}


@end
