//
//  ComposePingVC.h
//  Pinging
//
//  Created by Brexton Pham on 7/29/15.
//  Copyright (c) 2015 Brexton Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ComposePingVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) PFRelation *friendsRelation;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, strong) NSMutableArray *recipients;
@property (nonatomic, strong) PFObject *message;

@property (weak, nonatomic) IBOutlet UITableView *contactsTableView;
@property (weak, nonatomic) IBOutlet UILabel *previewYakLabel;
@property (strong, nonatomic) IBOutlet UIView *previewYakView;
@property (weak, nonatomic) IBOutlet UIView *navigationBarView;
@property (weak, nonatomic) IBOutlet UIView *sendBarView;

- (IBAction)sendButton:(id)sender;
- (IBAction)backButton:(id)sender;
- (void)uploadYak;

@end
