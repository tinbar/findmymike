//
//  legacyViewController.m
//  findmymike
//
//  Created by mike on 13-11-13.
//  Copyright (c) 2013 bymike. All rights reserved.
//

#import "legacyViewController.h"

@interface legacyViewController ()

@end

@implementation legacyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CLLocationManager *newLocationManager = [[CLLocationManager alloc] init];
    self.locationManager = newLocationManager;
    self.locationManager.delegate = self;
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tweetLocationWithTweet:(NSString *) withLocation:(CLLocation *)location
{
    
}


// Class IBActions
-(IBAction)tweetLocationAction:(id)sender
{
    // use this to tweet current location
    self.accountStore = [[ACAccountStore alloc] init];
    
    NSString *userName = @"tinbar";
    
    ACAccountType *twitterType =
    [self.accountStore accountTypeWithAccountTypeIdentifier:
     ACAccountTypeIdentifierTwitter];
    
    [self.accountStore requestAccessToAccountsWithType:twitterType
                                 withCompletionHandler:^(BOOL granted, NSError *error) {
                                     
                                     NSArray *accounts =
                                     [self.accountStore accountsWithAccountType:twitterType];
                                     
                                     //  Just use the first account for simplicity
                                     ACAccount *targetAccount = [accounts objectAtIndex:0];
                                     NSURL *usersShowUrl =
                                     [NSURL URLWithString:
                                      @"http://api.twitter.com/1/users/show.json"];
                                     TWRequest *userShowRequest =
                                     [[TWRequest alloc] initWithURL:usersShowUrl parameters:[
                                                                                             NSDictionary dictionaryWithObject:userName forKey:
                                                                                             @"screen_name"]
                                                      requestMethod:TWRequestMethodGET];
                                     
                                     //  Just use the first account for simplicity
                                     [userShowRequest setAccount:targetAccount];
                                     [userShowRequest performRequestWithHandler:^(NSData *
                                                                                  responseData,
                                                                                  NSHTTPURLResponse *
                                                                                  urlResponse,
                                                                                  NSError *error) {
                                         NSDictionary *userObject =
                                         (NSDictionary *)[NSJSONSerialization JSONObjectWithData:
                                                          responseData options:
                                                          NSJSONReadingAllowFragments error:NULL];
                                         
                                         // Check the status of the
                                         NSString *geoEnabled =
                                         [userObject objectForKey:@"geo_enabled"];
                                         if (!geoEnabled) {
                                             NSURL *statusUpdateUrl =
                                             [NSURL URLWithString:
                                              @"http://api.twitter.com/1/statuses/update.json"];
                                             
                                             //  Build a request that includes a status, lat, long
                                             NSDictionary *params =
                                             [NSDictionary dictionaryWithObjectsAndKeys:
                                              @"Just typing the tweets @Twitter.", @"status",
                                              @"37.7821120598956", @"lat", @"-122.400612831116",
                                              @"long",
                                              nil];
                                             
                                             TWRequest *requestWithGeo =
                                             [[TWRequest alloc] initWithURL:statusUpdateUrl parameters
                                                                           :
                                              params requestMethod:TWRequestMethodPOST];
                                             
                                             //  Post the status update from our target account
                                             [requestWithGeo setAccount:targetAccount];
                                             
                                             [requestWithGeo performRequestWithHandler:^(NSData *
                                                                                         responseData,
                                                                                         NSHTTPURLResponse
                                                                                         *urlResponse,
                                                                                         NSError *
                                                                                         error) {
                                                 NSDictionary *dict =
                                                 [NSJSONSerialization JSONObjectWithData:responseData
                                                  options
                                                                                        :NSJSONReadingAllowFragments error:NULL];
                                                 
                                                 // Print out what we received back
                                                 NSLog (@"%@", dict);
                                             }];
                                         } else {
                                             NSLog (@"Yikes. Geo is not enabled for user @%@",
                                                    userName);
                                             NSURL *statusUpdateUrl =
                                             [NSURL URLWithString:
                                              @"http://api.twitter.com/1/statuses/update.json"];
                                             
                                             //  Build a request that includes a status, lat, long
                                             NSDictionary *params =
                                             [NSDictionary dictionaryWithObjectsAndKeys:
                                              @"test test, iOS app twitter integration test @mikestarrunner", @"status",
                                              @"37.7821120598956", @"lat", @"-122.400612831116",
                                              @"long",
                                              nil];
                                             
                                             TWRequest *requestWithGeo =
                                             [[TWRequest alloc] initWithURL:statusUpdateUrl parameters
                                                                           :
                                              params requestMethod:TWRequestMethodPOST];
                                             
                                             //  Post the status update from our target account
                                             [requestWithGeo setAccount:targetAccount];
                                             
                                             [requestWithGeo performRequestWithHandler:^(NSData *
                                                                                         responseData,
                                                                                         NSHTTPURLResponse
                                                                                         *urlResponse,
                                                                                         NSError *
                                                                                         error) {
                                                 NSDictionary *dict =
                                                 [NSJSONSerialization JSONObjectWithData:responseData
                                                  options
                                                                                        :NSJSONReadingAllowFragments error:NULL];
                                                 
                                                 // Print out what we received back
                                                 NSLog (@"%@", dict);
                                             }];

                                             
                                         }
                                     }];
                                 }];
}

// CLLocationManager Delegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
}

@end
