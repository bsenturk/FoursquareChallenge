//
//  PlacesDetailViewModel.h
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 25.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlacesDetailViewModel : NSObject
@property NSString *venueId;
@property NSString *imageUrl;
@property NSString *tips;
- (void)venuesDetailRequest: (void(^)(void))completionBlock ;
@end

NS_ASSUME_NONNULL_END
