//
//  AppDelegate.h
//  Landmark
//
//  Created by Mike Henry on 10/7/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Landmarks.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow                               *window;
@property (nonatomic, strong) NSArray                                *landmarksArray;
@property (nonatomic, strong) NSString                               *selectedLandmarkName;
@property (readonly, strong, nonatomic) NSManagedObjectContext       *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel         *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


- (NSArray *)fetchLandmarks;
- (Landmarks *)fetchLandmarksByName: (NSString *)landmarkName;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

