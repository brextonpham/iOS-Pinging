//
//  SignUpVC.h
//  Pinging
//
//  Created by Brexton Pham on 7/27/15.
//  Copyright (c) 2015 Brexton Pham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UISwitch *verifySwitch;
@property (assign, nonatomic) BOOL phoneVerified;


- (IBAction)signupButton:(id)sender;
- (IBAction)dismissButton:(id)sender;

@end
