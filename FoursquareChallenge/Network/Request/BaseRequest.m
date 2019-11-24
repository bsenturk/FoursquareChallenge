//
//  BaseRequest.m
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 23.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

+(instancetype)sharedInstance {
    static BaseRequest *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BaseRequest alloc] init];
    });
    return sharedInstance;
}

- (NSString *)setHTTPMethod:(HTTPMethod)method {
    NSString *httpMethod;
    switch (method) {
        case get:
            httpMethod = @"GET";
            break;
        case post:
            httpMethod = @"POST";
            break;
        case patch:
            httpMethod = @"PATCH";
            break;
        case put:
            httpMethod = @"PUT";
            break;
        case delete:
            httpMethod = @"DELETE";
            break;
    }
    return httpMethod;
}

- (void)request: (NSDictionary *)urlParameters httpMethod:(HTTPMethod)method withCompletion:(void(^)(NSData *completionData))callback {

    NSURLComponents *components = [NSURLComponents componentsWithString:baseURL];
    NSMutableArray *queryArray = [NSMutableArray array];
    for (id key in urlParameters) {
        NSString *value = [urlParameters objectForKey:key];
        NSURLQueryItem *queryItems = [NSURLQueryItem queryItemWithName:key value:value];
        [queryArray addObject:queryItems];
    }

    components.queryItems = queryArray;

    NSURL *url = components.URL;

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
   NSString *setHTTPType = [self setHTTPMethod:method];
    [request setHTTPMethod: setHTTPType];

    request.timeoutInterval = 60.0;


    [[NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        NSLog(@"%@", request);

        if (error != nil) {
            NSLog(@"Error.. %@", error);
        } else {
            callback(data);
        }

        
    }] resume];

}

@end
