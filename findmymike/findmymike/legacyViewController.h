//
//  legacyViewController.h
//  findmymike
//
//  Created by mike on 13-11-13.
//  Copyright (c) 2013 bymike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface legacyViewController : UIViewController<CLLocationManagerDelegate>

@property(strong, nonatomic) CLLocationManager *locationManager;

@property(strong, nonatomic) ACAccountStore *accountStore;

@property(strong, nonatomic) IBOutlet UILabel *locationLabel;

@property(strong, nonatomic) IBOutlet UIButton *tweetButton;

-(IBAction)tweetLocationAction:(id)sender;


@end
