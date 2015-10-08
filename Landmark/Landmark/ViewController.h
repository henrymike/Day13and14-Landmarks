//
//  ViewController.h
//  Landmark
//
//  Created by Mike Henry on 10/7/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

//@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
//@property (nonatomic, strong) NSArray                *landmarksArray;
@property (nonatomic, weak)   IBOutlet UITableView   *landmarksTableView;

@end

