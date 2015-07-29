//
//  EditContactsVC.h
//  Pinging
//
//  Created by Brexton Pham on 7/29/15.
//  Copyright (c) 2015 Brexton Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditContactsVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *allUsers;
@property (nonatomic, strong) PFUser *currentUser;
@property (nonatomic, strong) NSMutableArray *friends;

@property (weak, nonatomic) IBOutlet UITableView *contactsTableView;
- (IBAction)backButton:(id)sender;



- (BOOL)isFriend:(PFUser *)user;

@end
