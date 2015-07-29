//
//  MainFeedTVC.m
//  Pinging
//
//  Created by Brexton Pham on 7/27/15.
//  Copyright (c) 2015 Brexton Pham. All rights reserved.
//

#import "MainFeedTVC.h"
#import "YakDetailVC.h"
#import "MainFeedCell.h"

@interface MainFeedTVC ()

@end

@implementation MainFeedTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Make self the delegate and datasource of the tableview
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    //check to see if user is logged in already
    
    PFUser *currentUser = [PFUser currentUser];
    NSLog(@"%@",[[PFUser currentUser] objectId]);
    
    if (currentUser) {
        NSLog(@"Current user: %@", currentUser.username);
    } else {
        //initial segue is to login screen at launch
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
    
    //refresh screen!
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(retrieveMessages) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    
    [self.tableView reloadData];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:NO];
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        NSLog(@"Current user: %@", currentUser.username);
        [self retrieveMessages];
    } else {
        //initial segue is to login screen at launch
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // return [self.messages count];
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CustomPrototypeCell";
    MainFeedCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [self configureBasicCell:cell atIndexPath:indexPath];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //leading to detailed message view
    self.selectedMessage = [self.messages objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLogin"]) { //go to login page
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    } else if ([segue.identifier isEqualToString:@"showDetail"]) { // go to yak
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
        YakDetailVC *detailViewController = (YakDetailVC *)segue.destinationViewController;
        detailViewController.message = self.selectedMessage;
        
    }
}

#pragma mark - helper methods

- (void)retrieveMessages {
    /* Retrieving all messages */
    PFQuery *query = [PFQuery queryWithClassName:@"Messages"];
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
                if (self.messages != nil) {
                    self.messages= nil;
                }
                self.messages = [[NSArray alloc] initWithArray:objects];
                [self.tableView reloadData];
            }
            
            if ([self.refreshControl isRefreshing]) { //ENDS REFRESHING
                [self.refreshControl endRefreshing];
            }
        }];
        
    }
}

//you get a reference to the item at the indexPath, which then gets and sets the titleLabel and subtitleLabel texts on the cell
- (void)configureBasicCell:(MainFeedCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    PFObject *message = [self.messages objectAtIndex:indexPath.row];
    NSString *text = [message objectForKey:@"fileContents"];
    [self setPostForCell:cell item:text];
}

//set labels
- (void)setPostForCell:(MainFeedCell *)cell item:(NSString *)item {
    NSString *yak = item;
    [cell.yakLabel setText:yak];
}

@end
