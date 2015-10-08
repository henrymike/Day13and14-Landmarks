//
//  MapViewController.m
//  Landmark
//
//  Created by Mike Henry on 10/7/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import "MapViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "Landmarks.h"

@interface MapViewController ()

@property (nonatomic, strong)            AppDelegate              *appDelegate;
@property (nonatomic, strong)            NSManagedObjectContext   *managedObjectContext;
@property (nonatomic, strong)            CLLocationManager        *locationManager;
@property (nonatomic, weak)     IBOutlet MKMapView                *landmarksMapView;

@end

@implementation MapViewController

#pragma mark - Annotation Methods

- (void)annotateMapLocations {
    NSMutableArray *pinsToRemove = [[NSMutableArray alloc] init];
    for (id <MKAnnotation> annot in [_landmarksMapView annotations]) {
        if ([annot isKindOfClass: [MKPointAnnotation class]]) {
            [pinsToRemove addObject:annot];
        }
    }
    [_landmarksMapView removeAnnotations:pinsToRemove];
    
    NSMutableArray *pinsToAdd = [[NSMutableArray alloc] init];
    for (Landmarks *landmark in _appDelegate.landmarksArray) {
        MKPointAnnotation *pa = [[MKPointAnnotation alloc] init];
        pa.coordinate = CLLocationCoordinate2DMake([landmark.landmarkLat doubleValue], [landmark.landmarkLong doubleValue]);
        pa.title = landmark.landmarkName;
        [pinsToAdd addObject:pa];
    }
    [_landmarksMapView addAnnotations:pinsToAdd];
}

#pragma mark - Location Methods

- (void)turnOnLocationMonitoring {
    [_locationManager startUpdatingLocation];
    _landmarksMapView.showsUserLocation = true;
}

- (void)setupLocationMonitoring {
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if ([CLLocationManager locationServicesEnabled]) {
        NSLog(@"Location Services enabled");
        switch ([CLLocationManager authorizationStatus]) {
            case kCLAuthorizationStatusAuthorizedAlways:
                [self turnOnLocationMonitoring];
                break;
            case kCLAuthorizationStatusAuthorizedWhenInUse:
                [self turnOnLocationMonitoring];
                break;
            case kCLAuthorizationStatusDenied:
                NSLog(@"Hey user, turn Location Services back on");
                break;
            case kCLAuthorizationStatusNotDetermined:
                if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
                    [_locationManager requestWhenInUseAuthorization];
                }
                break;
            case kCLAuthorizationStatusRestricted:
                NSLog(@"Hey user, turn Location Services back on");
                break;
            default:
                break;
        }
    } else {
        NSLog(@"Turn on your Location Services in Settings");
    }
}

//#pragma mark - Core Data Methods
//
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
//    _managedObjectContext = _appDelegate.managedObjectContext;
    _appDelegate.landmarksArray = [_appDelegate fetchLandmarks];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupLocationMonitoring];
    [self annotateMapLocations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
