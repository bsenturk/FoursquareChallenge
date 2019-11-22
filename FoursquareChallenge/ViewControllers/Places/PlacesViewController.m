//
//  PlacesViewController.m
//  FoursquareChallenge
//
//  Created by Burak Şentürk on 22.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

#import "PlacesViewController.h"
#import "PlacesCell.h"

@interface PlacesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation PlacesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Places";
}

- (void)setTableView:(UITableView *)tableView {
    [tableView registerNib:[UINib nibWithNibName:@"PlacesCell" bundle:nil] forCellReuseIdentifier:@"PlacesCell"];
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
    PlacesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlacesCell" forIndexPath:indexPath];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
