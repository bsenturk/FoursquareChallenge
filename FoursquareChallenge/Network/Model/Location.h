//
//  Location.h
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 24.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Location : NSObject
@property (strong, nonatomic) NSString *address;
@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double lng;
@property (strong, nonatomic) NSString *country;
@end

NS_ASSUME_NONNULL_END
