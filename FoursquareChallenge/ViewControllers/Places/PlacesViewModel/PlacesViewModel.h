//
//  PlacesViewModel.h
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 24.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Venues.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlacesViewModel : NSObject
- (void)venuesRequest:(void (^)(void))completionBlock;
- (NSUInteger)numberOfVenuesCount;
@property NSMutableArray <Venues *> *venues;
- (Venues *)didSelectVenue: (NSIndexPath *)indexPath;
@property NSString *query;
@property double lat;
@property double lng;
@property NSString *city;
@end

NS_ASSUME_NONNULL_END
