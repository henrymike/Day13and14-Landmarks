//
//  ViewController.m
//  Landmark
//
//  Created by Mike Henry on 10/7/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Landmarks.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation ViewController

#pragma mark - Interactivity Methods

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"Row to delete: %li",indexPath.row);
        Landmarks *landmarkToDelete = _appDelegate.landmarksArray[indexPath.row];
        [_managedObjectContext deleteObject:landmarkToDelete];
        [_appDelegate saveContext];
        _appDelegate.landmarksArray = [_appDelegate fetchLandmarks];
        [_landmarksTableView reloadData];
    }
}

#pragma mark - Table View Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _appDelegate.landmarksArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *landmarksCell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"landmarksCell"];
    Landmarks *currentLandmark = _appDelegate.landmarksArray[indexPath.row];
    landmarksCell.textLabel.text = currentLandmark.landmarkName;
    return landmarksCell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *destController = [segue destinationViewController];
    if ([[segue identifier] isEqualToString:@"segueEditLandmark"]) {
        NSIndexPath *indexPath = [_landmarksTableView indexPathForSelectedRow];
        Landmarks *currentLandmark = _appDelegate.landmarksArray[indexPath.row];
        destController.currentLandmark = currentLandmark;
    }
    if ([[segue identifier] isEqualToString:@"segueShowLandmark"]) {
        NSIndexPath *indexPath = [_landmarksTableView indexPathForSelectedRow];
        Landmarks *currentLandmark = _appDelegate.landmarksArray[indexPath.row];
        destController.currentLandmark = currentLandmark;
    }
    else if ([[segue identifier] isEqualToString:@"segueAddLandmark"]) {
        destController.currentLandmark = nil;
    }
}

#pragma mark - Core Data Methods

- (void)tempAddLandmarks {
    Landmarks *newLandmark = (Landmarks *)[NSEntityDescription insertNewObjectForEntityForName:@"Landmarks" inManagedObjectContext:_managedObjectContext];
    newLandmark.landmarkName = @"Lincoln Memorial";
    [_appDelegate saveContext];
}

//- (NSArray *)fetchLandmarks {
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Landmarks" inManagedObjectContext:_managedObjectContext];
//    [fetchRequest setEntity:entity];
//    NSArray *fetchResults = [_managedObjectContext executeFetchRequest:fetchRequest error:nil];
//    return fetchResults;
//}


#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _managedObjectContext = _appDelegate.managedObjectContext;
//    _landmarksArray = [[NSArray alloc] init];
//    [self tempAddLandmarks];
//    _landmarksArray = [self fetchLandmarks];
    _appDelegate.landmarksArray = [_appDelegate fetchLandmarks];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _appDelegate.landmarksArray = [_appDelegate fetchLandmarks];
//    _landmarksArray = [self fetchLandmarks];
    [_landmarksTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
