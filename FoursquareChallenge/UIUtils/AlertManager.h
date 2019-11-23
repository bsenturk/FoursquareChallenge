//
//  AlertManager.h
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 22.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface AlertManager : NSObject
+(instancetype)sharedInstance;
- (UIAlertController *) showAlert:(NSString *)description;
@end

NS_ASSUME_NONNULL_END
