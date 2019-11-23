//
//  LaunchScreenViewController.m
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 22.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import "LaunchScreenViewController.h"
#import "AppDelegate.h"
#import "MainPageViewController.h"

@interface LaunchScreenViewController ()

@end

@implementation LaunchScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        AppDelegate *appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
        UIViewController *mainPageViewController = [[MainPageViewController alloc]initWithNibName:@"MainPageViewController" bundle:nil];

            UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:mainPageViewController];
        appDelegate.window.rootViewController = navigationController;
    });


}

@end
