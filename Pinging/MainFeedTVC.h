//
//  MainFeedTVC.h
//  Pinging
//
//  Created by Brexton Pham on 7/27/15.
//  Copyright (c) 2015 Brexton Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MainFeedTVC : UITableViewController

@property (nonatomic, strong) NSArray *allUsers;
@property (nonatomic, strong) PFObject *selectedMessage;
@property (nonatomic, strong) NSArray *messages;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

- (void)fetchNewDataWithCompletionHandler:(void(^)(UIBackgroundFetchResult))completionHandler;

@end
