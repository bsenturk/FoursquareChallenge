//
//  PlacesDetailViewController.m
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 25.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import "PlacesDetailViewController.h"
#import "PlacesDetailViewModel.h"
#import "ProgressManager.h"

@interface PlacesDetailViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet MKMapView *venuesMapView;
@property (weak, nonatomic) IBOutlet UIImageView *venuesImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblVenueName;
@property (weak, nonatomic) IBOutlet UILabel *lblTips;
@property (weak, nonatomic) IBOutlet UILabel *lblVenueDescription;
@end

@implementation PlacesDetailViewController

    PlacesDetailViewModel *placesDetailViewModel;

- (void)viewDidLoad {
    [super viewDidLoad];

    [[ProgressManager sharedInstance]showAnimating:self.view];

    placesDetailViewModel = PlacesDetailViewModel.new;
    placesDetailViewModel.venueId = self.selectedVenue.venueId;

    [placesDetailViewModel venuesDetailRequest:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setData];
            [[ProgressManager sharedInstance]stopAnimating];
        });
    }];

    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapView:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];

}

- (void)handleTapView: (UITapGestureRecognizer *)recognizer {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)setupUI {
    self.containerView.layer.cornerRadius = 12;
    self.containerView.layer.masksToBounds = true;
}

- (void)setData {

    MKPointAnnotation *annotation = MKPointAnnotation.new;
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(self.selectedVenue.location.lat,
                                                                    self.selectedVenue.location.lng);

    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);

    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    annotation.coordinate = coordinate;

    self.venuesMapView.region = region;

    [self.venuesMapView addAnnotation:annotation];

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *data = [[NSData alloc]initWithContentsOfURL: [NSURL URLWithString:placesDetailViewModel.imageUrl]];
        if (data == nil) {
            return;
        }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.venuesImageView.image = [UIImage imageWithData:data];
            });
    });

    self.lblVenueName.text = self.selectedVenue.name;

    self.lblTips.text = @"Tips";

    self.lblVenueDescription.text = placesDetailViewModel.tips;


}

@end
