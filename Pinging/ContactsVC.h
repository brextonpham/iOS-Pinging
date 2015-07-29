//
//  ContactsVC.h
//  Pinging
//
//  Created by Brexton Pham on 7/29/15.
//  Copyright (c) 2015 Brexton Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ContactsVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) PFRelation *friendsRelation;
@property (nonatomic, strong) NSArray *friends;

- (IBAction)cancelButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *contactsTableView;

@end
