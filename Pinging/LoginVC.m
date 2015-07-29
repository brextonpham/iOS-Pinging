//
//  LoginVC.m
//  Pinging
//
//  Created by Brexton Pham on 7/28/15.
//  Copyright (c) 2015 Brexton Pham. All rights reserved.
//

#import "LoginVC.h"
#import <Parse/Parse.h>

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    [self.navigationController.navigationBar setHidden:YES]; //hides navigation bar
}

- (IBAction)loginButton:(id)sender {
    //storing information from text fields
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //alerts user if nothing is inputted into fields
    if ([username length] == 0 || [password length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter a username and password!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    } else {
        //logs user in in parse background
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            } else {
                [self.navigationController popToRootViewControllerAnimated:YES]; //pop back to root controller (home screen)
            }
        }];
        
    }
}

@end
