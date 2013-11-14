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
}

// CLLocationManager Delegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
}

@end
