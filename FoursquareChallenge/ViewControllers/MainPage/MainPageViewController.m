//
//  MainPageViewController.m
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 21.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import "MainPageViewController.h"
#import "PlacesViewController.h"

@interface MainPageViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnSearch;
@property (weak, nonatomic) IBOutlet UITextField *placeTextField;
@property (weak, nonatomic) IBOutlet UITextField *areaTextField;
@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Main Page";
    [self getUserLocation];
    [self checkLocationPermission];
    [self setupUI];

}

- (void)setupUI {
    [self textFieldCursorPosition: self.placeTextField];
    self.placeTextField.placeholder = @"Exp. Cafe, Bar";
    self.placeTextField.layer.cornerRadius = 6;

    [self textFieldCursorPosition: self.areaTextField];
    self.areaTextField.placeholder = @"Close to me";
    self.areaTextField.layer.cornerRadius = 6;

    [self.btnSearch setTitle:@"Search" forState:UIControlStateNormal];
    self.btnSearch.layer.cornerRadius = 6;
    [self buttonImageView: self.btnSearch];
}

- (void)getUserLocation {
    self.locationManager = CLLocationManager.new;
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
}

- (void)checkLocationPermission {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];

    if(status == kCLAuthorizationStatusNotDetermined) {
         [self.locationManager requestWhenInUseAuthorization];
    }
    else if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {

    }

}

- (void) buttonImageView:(UIButton *)btn {
    UIImageView *imgSearch = [[UIImageView alloc]initWithFrame:CGRectMake(12,
                                                                          btn.frame.size.height / 4,
                                                                          18,
                                                                          18)];
    imgSearch.image = [UIImage imageNamed:@"icon_search"];
    [btn addSubview:imgSearch];
}

- (void) textFieldCursorPosition:(UITextField *)textField {
    UIView *paddingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 12, 20)];
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;
}

- (IBAction)btnSearchAction:(id)sender {

    if (self.placeTextField.text.length >= 3) {
        PlacesViewController *placesViewController = [[PlacesViewController alloc]initWithNibName:@"PlacesViewController" bundle:nil];
        placesViewController.query = self.placeTextField.text;
        placesViewController.lat = self.lat;
        placesViewController.lng = self.lng;
        placesViewController.city = self.areaTextField.text;
        [self.navigationController pushViewController:placesViewController animated:YES];
    } else {
        [self showAlert];
    }
}

- (void)showAlert {
    UIAlertController *alertController = [[AlertManager sharedInstance]showAlert:@"Lütfen mekan için en az 3 harf giriniz."];

    [self presentViewController:alertController
                       animated:YES
                     completion:nil];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations lastObject];
    self.lat = location.coordinate.latitude;
    self.lng = location.coordinate.longitude;
    self.locationManager.delegate = nil;
}

@end
