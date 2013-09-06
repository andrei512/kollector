//
//  CDAlert.h
//  APFramework
//
//  Created by Andrei on 8/25/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CDAlert : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSDate * fireDate;
@property (nonatomic, retain) NSNumber * repeats;
@property (nonatomic, retain) NSString * cron;

@end
