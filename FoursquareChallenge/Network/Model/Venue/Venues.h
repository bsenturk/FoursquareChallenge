//
//  Venues.h
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 24.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"
#import "Categories.h"

NS_ASSUME_NONNULL_BEGIN

@interface Venues : NSObject
@property (strong, nonatomic) NSString *venueId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) Location *location;
@property (strong, nonatomic) Categories *categories;
@end

NS_ASSUME_NONNULL_END
