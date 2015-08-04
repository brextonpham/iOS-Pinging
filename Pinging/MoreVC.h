//
//  MoreVC.h
//  Pinging
//
//  Created by Brexton Pham on 8/3/15.
//  Copyright (c) 2015 Brexton Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MoreVC : UIViewController

@property (nonatomic, strong) PFUser *currentUser;

- (IBAction)logoutButton:(id)sender;

@end
