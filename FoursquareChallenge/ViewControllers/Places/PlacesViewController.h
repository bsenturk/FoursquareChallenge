//
//  PlacesViewController.h
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 22.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlacesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property NSString *query;
@property double lat;
@property double lng;
@property NSString *city;
@end

NS_ASSUME_NONNULL_END
