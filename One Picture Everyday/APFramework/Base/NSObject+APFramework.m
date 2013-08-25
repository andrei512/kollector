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

+ (NSMutableDictionary *)stashWithName:(NSString *)name {
    static NSMutableDictionary *metaStash = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        metaStash = [NSMutableDictionary dictionary];
    });
    NSString *className = NSStringFromClass([self class]);
    if (metaStash[className] == nil) {
        metaStash[className] = [self new];
    }
    return metaStash[className];
}

+ (id)load:(StashBlock)block forKey:(NSString *)key {
    if ([self stashWithName:key][self.className]) {
        
    }
    return nil;
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


@end
