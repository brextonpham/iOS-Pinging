//
//  YakDetailVC.h
//  Pinging
//
//  Created by Brexton Pham on 7/28/15.
//  Copyright (c) 2015 Brexton Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface YakDetailVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *yakLabel; //label displaying yak
@property (nonatomic, strong) PFObject *message; //passing in yak data

@end
