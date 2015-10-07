//
//  DetailViewController.m
//  Landmark
//
//  Created by Mike Henry on 10/7/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface DetailViewController ()

@property (nonatomic, strong)          AppDelegate              *appDelegate;
@property (nonatomic, strong)          NSManagedObjectContext   *managedObjectContext;
@property (nonatomic, weak)   IBOutlet UITextField         *nameTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *latTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *longField;
@property (nonatomic, weak)   IBOutlet UITextField         *imageNameField;
@property (nonatomic, weak)   IBOutlet UITextField         *addressStreetTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *addressCityTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *addressStateTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *addressZipTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *websiteTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *phoneTextField;
@property (nonatomic, weak)   IBOutlet UITextView          *descriptionTextView;

@end

@implementation DetailViewController

#pragma mark - Interactivity Methods

- (void)saveAndPop {
    [_appDelegate saveContext];
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)saveButtonPressed:(id)sender {
    _currentLandmark.landmarkName = _nameTextField.text;
    _currentLandmark.landmarkLat = _latTextField.text;
    _currentLandmark.landmarkLong = _longField.text;
    _currentLandmark.landmarkImageName = _imageNameField.text;
    _currentLandmark.landmarkStreet = _addressStreetTextField.text;
    _currentLandmark.landmarkCity = _addressCityTextField.text;
    _currentLandmark.landmarkState = _addressStateTextField.text;
    _currentLandmark.landmarkZip = _addressZipTextField.text;
    _currentLandmark.landmarkWebsite = _websiteTextField.text;
    _currentLandmark.landmarkPhone = _phoneTextField.text;
    _currentLandmark.landmarkDescription = _descriptionTextView.text;
    _currentLandmark.dateUpdated = [NSDate date];
    _currentLandmark.userID = @"System";
    [self saveAndPop];
}


#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _managedObjectContext = _appDelegate.managedObjectContext;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (_currentLandmark != nil) {
        NSLog(@"EDIT");
        _nameTextField.text = _currentLandmark.landmarkName;
        _latTextField.text = _currentLandmark.landmarkLat;
        _longField.text = _currentLandmark.landmarkLong;
        _imageNameField.text = _currentLandmark.landmarkImageName;
        _addressStreetTextField.text = _currentLandmark.landmarkStreet;
        _addressCityTextField.text = _currentLandmark.landmarkCity;
        _addressStateTextField.text = _currentLandmark.landmarkState;
        _addressZipTextField.text = _currentLandmark.landmarkZip;
        _websiteTextField.text = _currentLandmark.landmarkWebsite;
        _descriptionTextView.text = _currentLandmark.landmarkDescription;
    } else {
        NSLog(@"NEW");
        Landmarks *newLandmark = (Landmarks *)[NSEntityDescription insertNewObjectForEntityForName:@"Landmarks" inManagedObjectContext:_managedObjectContext];
        newLandmark.dateEntered = [NSDate date];
        _currentLandmark = newLandmark;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
