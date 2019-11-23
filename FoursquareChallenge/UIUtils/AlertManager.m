//
//  AlertManager.m
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 22.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import "AlertManager.h"

@implementation AlertManager

+(instancetype)sharedInstance {
    static AlertManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AlertManager alloc] init];
    });
    return sharedInstance;
}

- (UIAlertController *) showAlert:(NSString *)description {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Uyarı!"
                                          message:description
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"Tamam" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

    }];

    [alertController addAction:okButton];

    return alertController;
}

@end
