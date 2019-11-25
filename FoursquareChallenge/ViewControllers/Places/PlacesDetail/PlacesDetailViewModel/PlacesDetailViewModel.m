//
//  PlacesDetailViewModel.m
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 25.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import "PlacesDetailViewModel.h"
#import "BaseRequest.h"

@implementation PlacesDetailViewModel

- (void)venuesDetailRequest: (void(^)(void))completionBlock {

    NSDictionary *params = @{
                                 @"client_id": clientId,
                                 @"client_secret": clientSecret,
                                 @"v": @"20191123"
                                 };

    NSMutableString *path = NSMutableString.new;
    [path appendString: @"/"];
    [path appendString:self.venueId];
    
    [[BaseRequest sharedInstance]request:params urlPath:path httpMethod:get withCompletion:^(NSData * _Nonnull completionData) {

        NSDictionary *venuesJson = [NSJSONSerialization JSONObjectWithData:completionData options:NSJSONReadingAllowFragments error:nil];

        NSDictionary *response = venuesJson[@"response"];

        NSDictionary *venuesArray = response[@"venue"];

        NSDictionary *tipsDict = venuesArray[@"tips"];

        NSDictionary *photoDict = venuesArray[@"bestPhoto"];

        if(photoDict[@"prefix"] != nil || photoDict[@"suffix"] != nil){
            NSString *prefix = photoDict[@"prefix"];
            NSString *suffix = photoDict[@"suffix"];

            NSMutableString *photoUrl = NSMutableString.new;
            [photoUrl appendString:prefix];
            [photoUrl appendString:suffix];
            self.imageUrl = photoUrl;
        }

        NSArray *groupsArray = [tipsDict valueForKey:@"groups"];

        for (NSDictionary *groupDict in groupsArray) {
            NSArray *itemArray = groupDict[@"items"];

            for (NSDictionary *itemDict in itemArray) {
                NSString *text = itemDict[@"text"];
                self.tips = text;
            }

        }
        completionBlock();
    }];
}

@end
