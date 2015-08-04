//
//  MeVC.m
//  Pinging
//
//  Created by Brexton Pham on 8/4/15.
//  Copyright (c) 2015 Brexton Pham. All rights reserved.
//

#import "MeVC.h"

@interface MeVC ()

@end

@implementation MeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self retrieveNotifications];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self retrieveNotifications];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.notifications count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    PFObject *notification = [self.notifications objectAtIndex:indexPath.row];
    NSString *text = [notification objectForKey:@"ping"];
    cell.textLabel.text = text;
    
    return cell;
}

- (void)retrieveNotifications {
    /* Retrieving all notifications */
    PFQuery *query = [PFQuery queryWithClassName:@"Notifications"];
    if ([[PFUser currentUser] objectId] == nil) {
        NSLog(@"No objectID");
    } else {
        NSLog(@"%@",[[PFUser currentUser] objectId]);
        [query whereKey:@"recipientIds" equalTo:[[PFUser currentUser] objectId]];
        [query orderByDescending:@"createdAt"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (error) {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            } else {
                if (self.notifications != nil) {
                    self.notifications = nil;
                }
                self.notifications = [[NSMutableArray alloc] initWithArray:objects];
                [self.tableView reloadData];
            }
        }];
        
    }
}

@end
