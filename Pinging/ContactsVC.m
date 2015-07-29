//
//  ContactsVC.m
//  Pinging
//
//  Created by Brexton Pham on 7/29/15.
//  Copyright (c) 2015 Brexton Pham. All rights reserved.
//

#import "ContactsVC.h"
#import "EditContactsVC.h"

@interface ContactsVC ()

@end

@implementation ContactsVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    //retrieving friends relation for current user
    self.friendsRelation = [[PFUser currentUser] objectForKey:@"friendsRelation"];
    
    //obtaining current user's friend query
    PFQuery *query = [self.friendsRelation query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error %@ %@", error, [error userInfo]);
        } else {
            self.friends = objects; //setting friends to array retrieved from parse
            [self.contactsTableView reloadData]; //reloading tableView
        }
    }];
    
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showEditFriends"]) {
        EditContactsVC *viewController = (EditContactsVC *)segue.destinationViewController;
        viewController.friends = [NSMutableArray arrayWithArray:self.friends];
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.friends count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    PFUser *user = [self.friends objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    return cell;
}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
