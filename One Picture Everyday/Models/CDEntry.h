//
//  CDEntry.h
//  kollector
//
//  Created by Andrei on 8/25/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDCollection, CDPicture;

@interface CDEntry : NSManagedObject

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSData * extraInformation;
@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) CDPicture *picture;
@property (nonatomic, retain) CDCollection *owner;

@end
