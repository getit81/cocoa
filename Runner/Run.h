//
//  Run.h
//  Runner
//
//  Created by David Brünner on 11.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Run : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * distance;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSOrderedSet *coordinates;
@end

@interface Run (CoreDataGeneratedAccessors)

- (void)insertObject:(NSManagedObject *)value inCoordinatesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromCoordinatesAtIndex:(NSUInteger)idx;
- (void)insertCoordinates:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeCoordinatesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInCoordinatesAtIndex:(NSUInteger)idx withObject:(NSManagedObject *)value;
- (void)replaceCoordinatesAtIndexes:(NSIndexSet *)indexes withCoordinates:(NSArray *)values;
- (void)addCoordinatesObject:(NSManagedObject *)value;
- (void)removeCoordinatesObject:(NSManagedObject *)value;
- (void)addCoordinates:(NSOrderedSet *)values;
- (void)removeCoordinates:(NSOrderedSet *)values;
@end
