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

@property (nonatomic, strong)            AppDelegate                *appDelegate;
@property (nonatomic, strong)            NSManagedObjectContext     *managedObjectContext;
@property (nonatomic, weak)     IBOutlet UIImageView                *landmarkImageView;
@property (nonatomic, weak)     IBOutlet UILabel                    *nameLabel;
@property (nonatomic, weak)     IBOutlet UILabel                    *addressStreetLabel;
@property (nonatomic, weak)     IBOutlet UILabel                    *addressCityLabel;
@property (nonatomic, weak)     IBOutlet UILabel                    *addressStateLabel;
@property (nonatomic, weak)     IBOutlet UILabel                    *addressZipLabel;
@property (nonatomic, weak)     IBOutlet UILabel                    *websiteLabel;
@property (nonatomic, weak)     IBOutlet UILabel                    *phoneLabel;
@property (nonatomic, weak)     IBOutlet UITextView                 *descriptionTextView;

@end

@implementation FullDetailViewController

#pragma mark - Display Methods


#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _landmarkImageView.image = [UIImage imageNamed:_currentLandmark.landmarkImageName];
    _nameLabel.text = _currentLandmark.landmarkName;
    _addressStreetLabel.text = _currentLandmark.landmarkStreet;
    _addressCityLabel.text = _currentLandmark.landmarkCity;
    _addressStateLabel.text = _currentLandmark.landmarkState;
    _addressZipLabel.text = _currentLandmark.landmarkZip;
    _websiteLabel.text = _currentLandmark.landmarkWebsite;
    _phoneLabel.text = _currentLandmark.landmarkPhone;
    _descriptionTextView.text = _currentLandmark.landmarkDescription;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
