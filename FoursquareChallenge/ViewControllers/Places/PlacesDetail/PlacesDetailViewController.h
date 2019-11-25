//
//  PlacesDetailViewController.h
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 25.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import "Venues.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlacesDetailViewController : UIViewController
@property (nonatomic) Venues *selectedVenue;
@end

NS_ASSUME_NONNULL_END
