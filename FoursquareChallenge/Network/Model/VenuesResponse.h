//
//  VenuesResponse.h
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 23.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Meta;
@class Response;
@class Venues;
@class Location;
@class Icon;
@class Categories;

NS_ASSUME_NONNULL_BEGIN

@interface VenuesResponse : NSObject
@property (strong, nonatomic) Meta *meta;
@property (strong, nonatomic) Response *response;
@end

@interface Meta : NSObject
@property (strong, nonatomic) NSNumber *code;
@property (strong, nonatomic) NSString *requestId;
@end

@interface Response : NSObject
@property (strong, nonatomic) NSMutableArray <Venues *> *venues;
@end

//@interface Venues : NSObject
//@property (strong, nonatomic) NSString *venueId;
//@property (strong, nonatomic) NSString *name;
//@property (strong, nonatomic) Location *location;
//@property (strong, nonatomic) Categories *categories;
//@end
//
//@interface Location : NSObject
//@property (strong, nonatomic) NSString *address;
//@property double *lat;
//@property double *lng;
//@property (strong, nonatomic) NSString *country;
//@end
//
//@interface Categories : NSObject
//@property (strong, nonatomic) Icon *icon;
//@end
//
//@interface Icon : NSObject
//@property (strong, nonatomic) NSString *prefix;
//@property (strong, nonatomic) NSString *suffix;
//@end


NS_ASSUME_NONNULL_END
