//
//  PlacesCell.m
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 22.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import "PlacesCell.h"

@implementation PlacesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setVenues:(Venues *)venues {
    self.lblPlaceTitle.text = venues.name;
    self.lblPlaceAddress.text = venues.location.address;
    self.lblPlaceCountry.text = venues.location.country;
}


@end
