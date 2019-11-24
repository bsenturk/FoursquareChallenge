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

@interface PlacesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation PlacesViewController

    NSString *cellIdentifier = @"PlacesCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Places";

    NSDictionary *dictionary = @{
        @"client_id": clientId,
        @"client_secret": clientSecret,
        @"query": @"bar",
        @"near": @"Istanbul",
        @"v": @"20191123"
    };

    [[BaseRequest sharedInstance]request:dictionary httpMethod:get withCompletion:^(NSData * _Nonnull completionData) {
        NSLog(@"%@", completionData);

        VenuesResponse *venusResponse = VenuesResponse.new;

       NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:completionData options:NSJSONReadingAllowFragments error:nil];

        NSString *jsonData = [[NSString alloc]initWithData:completionData encoding:NSUTF8StringEncoding];

        NSLog(@"%@",jsonData);

        for (NSDictionary *list in dict) {

            NSNumber *code = list[@"meta"];

        }
    }];

}

- (void)setTableView:(UITableView *)tableView {
    [tableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellReuseIdentifier:cellIdentifier];
    tableView.rowHeight = 90;
}

//MARK:- Table View delegate & data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlacesCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
