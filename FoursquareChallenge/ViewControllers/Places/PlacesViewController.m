//
//  PlacesViewController.m
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 22.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import "PlacesViewController.h"
#import "PlacesCell.h"
#import "BaseRequest.h"
#import "VenuesResponse.h"
#import "PlacesViewModel.h"
#import "PlacesDetailViewController.h"
#import "ProgressManager.h"

@interface PlacesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation PlacesViewController

    NSString *cellIdentifier = @"PlacesCell";
    PlacesViewModel *placesViewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Places";

     placesViewModel = PlacesViewModel.new;

    [[ProgressManager sharedInstance]showAnimating:self.view];

    [_tableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellReuseIdentifier:cellIdentifier];
    _tableView.rowHeight = 90;

    [placesViewModel venuesRequest:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [[ProgressManager sharedInstance]stopAnimating];
            [self.tableView reloadData];
        });
    }];

}

//MARK:- Table View delegate & data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [placesViewModel numberOfVenuesCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlacesCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setVenues:placesViewModel.venues[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PlacesDetailViewController *placesDetailViewController = [[PlacesDetailViewController alloc]initWithNibName:@"PlacesDetailViewController" bundle:nil];
    placesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    placesDetailViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    placesDetailViewController.selectedVenue = [placesViewModel didSelectVenue:indexPath];
    [self presentViewController:placesDetailViewController animated:true completion:nil];
}


@end
