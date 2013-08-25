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



typedef id(^StashBlock)(void);

@interface NSObject (APFramework)

+ (instancetype)sharedInstance;

+ (NSMutableDictionary *)stashWithName:(NSString *)name;

+ (NSString *)className;
- (NSString *)className;

+ (NSDictionary *)config;
+ (id)$:(NSString *)key;
- (id)$:(NSString *)key;


@end
