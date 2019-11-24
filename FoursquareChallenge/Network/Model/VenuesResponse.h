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

@end


NS_ASSUME_NONNULL_END
