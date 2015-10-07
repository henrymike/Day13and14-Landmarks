//
//  Landmarks+CoreDataProperties.h
//  Landmark
//
//  Created by Mike Henry on 10/7/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Landmarks.h"

NS_ASSUME_NONNULL_BEGIN

@interface Landmarks (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *landmarkName;
@property (nullable, nonatomic, retain) NSString *landmarkDescription;
@property (nullable, nonatomic, retain) NSString *landmarkLat;
@property (nullable, nonatomic, retain) NSString *landmarkLong;
@property (nullable, nonatomic, retain) NSString *landmarkImageName;
@property (nullable, nonatomic, retain) NSString *landmarkStreet;
@property (nullable, nonatomic, retain) NSString *landmarkCity;
@property (nullable, nonatomic, retain) NSString *landmarkState;
@property (nullable, nonatomic, retain) NSString *landmarkZip;
@property (nullable, nonatomic, retain) NSString *landmarkWebsite;
@property (nullable, nonatomic, retain) NSString *landmarkPhone;
@property (nullable, nonatomic, retain) NSDate *dateEntered;
@property (nullable, nonatomic, retain) NSDate *dateUpdated;
@property (nullable, nonatomic, retain) NSString *userID;

@end

NS_ASSUME_NONNULL_END
