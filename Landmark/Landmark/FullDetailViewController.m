//
//  FullDetailViewController.m
//  Landmark
//
//  Created by Mike Henry on 10/8/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import "FullDetailViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface FullDetailViewController ()

@property (nonatomic, strong)            AppDelegate              *appDelegate;
@property (nonatomic, strong)            NSManagedObjectContext   *managedObjectContext;
@property (nonatomic, weak)     IBOutlet UILabel                  *tempLabel;

@end

@implementation FullDetailViewController

#pragma mark - Display Methods


#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _tempLabel.text = _currentLandmark.landmarkName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
