//
//  NSObject+APFramework.h
//  kollector
//
//  Created by Andrei on 8/24/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UNIQUE_KEY  
#define METHOD_SCOPE
#define FILE_SCOPE

typedef NSString *(^KeyBlock)(NSString *key);

typedef id(^StashBlock)(void);

@interface NSObject (APFramework)

- (KeyBlock)instanceKey;
- (KeyBlock)classKey;

+ (KeyBlock)classKey;

+ (instancetype)sharedInstance;

+ (NSMutableDictionary *)globalStashWithKey:(NSString *)key;
+ (NSMutableDictionary *)classStashWithKey:(NSString *)key;

- (NSMutableDictionary *)globalStashWithKey:(NSString *)key;
- (NSMutableDictionary *)classStashWithKey:(NSString *)key;
- (NSMutableDictionary *)instanceStashWithKey:(NSString *)key;

+ (NSString *)className;
- (NSString *)className;

+ (NSDictionary *)config;
+ (id)$:(NSString *)key;
- (id)$:(NSString *)key;

+ (id)load:(StashBlock)block forKey:(NSString *)key;
- (id)load:(StashBlock)block forKey:(NSString *)key;

@end
