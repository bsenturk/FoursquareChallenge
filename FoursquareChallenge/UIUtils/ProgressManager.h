//
//  ProgressManager.h
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 25.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProgressManager : NSObject
+(instancetype)sharedInstance;
@property UIActivityIndicatorView *activityIndicator;
@property UIView *progressView;
- (void)showAnimating: (UIView *)view;
- (void)stopAnimating;
@end

NS_ASSUME_NONNULL_END
