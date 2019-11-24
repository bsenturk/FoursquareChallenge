//
//  PlacesCell.h
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 22.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Venues.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlacesCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblPlaceTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlaceAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblPlaceCountry;
@property (strong, nonatomic) Venues *venues;
@end

NS_ASSUME_NONNULL_END
