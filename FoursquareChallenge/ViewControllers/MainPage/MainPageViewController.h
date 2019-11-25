//
//  MainPageViewController.h
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 21.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertManager.h"
#import "CoreLocation/CoreLocation.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainPageViewController : UIViewController <CLLocationManagerDelegate>

@property CLLocationManager *locationManager;
@property double lat;
@property double lng;
@end

NS_ASSUME_NONNULL_END
