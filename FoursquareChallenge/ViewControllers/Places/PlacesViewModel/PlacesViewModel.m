//
//  PlacesViewModel.m
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 24.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import "PlacesViewModel.h"
#import "BaseRequest.h"
#import "Location.h"
#import "Categories.h"
#import "Icon.h"
#import <UIKit/UITableView.h>

@interface PlacesViewModel ()

@end

@implementation PlacesViewModel

- (void)venuesRequest:(void (^)(void))completionBlock {

    NSDictionary *dictionary = @{
                                 @"client_id": clientId,
                                 @"client_secret": clientSecret,
                                 @"query": @"bar",
                                 @"near": @"Istanbul",
                                 @"v": @"20191123"
                                 };

    [[BaseRequest sharedInstance]request:dictionary httpMethod:get withCompletion:^(NSData * _Nonnull completionData) {

        NSDictionary *venuesJson = [NSJSONSerialization JSONObjectWithData:completionData options:NSJSONReadingAllowFragments error:nil];

        self.venues = NSMutableArray.new;

        NSDictionary *response = venuesJson[@"response"];

        NSArray *venuesArray = [response valueForKey:@"venues"];

        for (NSDictionary *venuesList in venuesArray) {

            Venues *venue = Venues.new;
            
            NSString *name = venuesList[@"name"];
            NSString *venueId = venuesList[@"id"];
            NSDictionary *locationArray = venuesList[@"location"];
            NSArray *categoriesArray = [venuesList valueForKey:@"categories"];

            venue.name = name;
            venue.venueId = venueId;

            Location *location = Location.new;
            NSString *address = locationArray[@"address"];
            double lat = [locationArray[@"lat"] doubleValue];
            double lng = [locationArray[@"lng"] doubleValue];
            NSString *country = locationArray[@"country"];

            location.address = address;
            location.lat = lat;
            location.lng = lng;
            location.country = country;

            venue.location = location;

            for (NSDictionary *categoriesDict in categoriesArray) {
                Categories *categories = Categories.new;
                NSDictionary *iconArray = categoriesDict[@"icon"];

                Icon *icon = Icon.new;
                NSString *prefix = iconArray[@"prefix"];
                NSString *suffix = iconArray[@"suffix"];

                icon.prefix = prefix;
                icon.suffix = suffix;

                categories.icon = icon;

            }

            [self.venues addObject:venue];

        }

        completionBlock();


    }];

}

- (NSUInteger)numberOfVenuesCount {
    return self.venues.count;
}

@end
