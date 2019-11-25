//
//  ProgressManager.m
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 25.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import "ProgressManager.h"

@implementation ProgressManager

+(instancetype)sharedInstance {
    static ProgressManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ProgressManager alloc] init];
    });
    return sharedInstance;
}

- (void)showAnimating: (UIView *)view {

    self.progressView = UIView.new;
    [view addSubview:self.progressView];
    self.progressView.translatesAutoresizingMaskIntoConstraints = false;
    self.progressView.backgroundColor = UIColor.lightGrayColor;
    self.progressView.layer.cornerRadius = 5;
    [self.progressView.centerXAnchor constraintEqualToAnchor:view.centerXAnchor].active = YES;
    [self.progressView.centerYAnchor constraintEqualToAnchor:view.centerYAnchor].active = YES;
    [self.progressView.heightAnchor constraintEqualToConstant:100].active = YES;
    [self.progressView.widthAnchor constraintEqualToConstant:100].active = YES;

    self.activityIndicator = UIActivityIndicatorView.new;
    self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false;
    self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [self.progressView addSubview:self.activityIndicator];

    [self.activityIndicator.centerYAnchor constraintEqualToAnchor:self.progressView.centerYAnchor].active = YES;
    [self.activityIndicator.centerXAnchor constraintEqualToAnchor:self.progressView.centerXAnchor].active = YES;

    [self.activityIndicator startAnimating];

}

-(void)stopAnimating {
    [self.activityIndicator stopAnimating];
    [self.progressView removeFromSuperview];
}


@end
