//
//  YakDetailVC.m
//  Pinging
//
//  Created by Brexton Pham on 7/28/15.
//  Copyright (c) 2015 Brexton Pham. All rights reserved.
//

#import "YakDetailVC.h"

@interface YakDetailVC ()

@end

@implementation YakDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *yak = [self.message objectForKey:@"fileContents"];
    self.yakLabel.text = [self.message objectForKey:@"fileContents"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    /*
    if ([segue.identifier isEqualToString:@"showPing"]) {
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
        PingContactsTableViewController *pingController = (PingContactsTableViewController *)segue.destinationViewController;
        pingController.message = self.message;
    }
     */
}


@end
