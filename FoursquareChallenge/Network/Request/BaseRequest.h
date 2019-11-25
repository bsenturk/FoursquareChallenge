//
//  BaseRequest.h
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 23.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EndPoints.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum HTTPMethod {
    get,
    post,
    patch,
    put,
    delete
}HTTPMethod;

@interface BaseRequest : NSObject
+(instancetype)sharedInstance;
- (void)request: (NSDictionary *)urlParameters urlPath:(NSString *)path httpMethod:(HTTPMethod)method withCompletion:(void(^)(NSData *completionData))callback;
@end

NS_ASSUME_NONNULL_END
