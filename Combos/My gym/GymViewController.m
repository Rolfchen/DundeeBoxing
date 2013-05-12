//
//  GymViewController.m
//  Combos
//
//  Created by Rolf Chen on 24/03/12.
//  Copyright (c) 2012 Australian Tourism Data Warehouse. All rights reserved.
//

#import "GymViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation GymViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    [banner setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BannerBg"]]];
    [titleLabel setFont:[UIFont fontWithName:@"UniversCondensed" size:36]];
    titleLabel.layer.shadowColor = [[UIColor blackColor] CGColor];
    
    scrollView.contentSize = contentView.bounds.size;
    [scrollView addSubview:contentView];
    
    lblAddress.font = [UIFont fontWithName:@"UniversCondensed" size:25];
    lblEmail.font = [UIFont fontWithName:@"UniversCondensed" size:20];
    lblMobile.font = [UIFont fontWithName:@"UniversCondensed" size:20];
    lblOpenHour.font = [UIFont fontWithName:@"UniversCondensed" size:20];
    lblWebsite.font = [UIFont fontWithName:@"UniversCondensed" size:20];
    lblGym.font = [UIFont fontWithName:@"UniversCondensed" size:20];
    
    [map setCenterCoordinate:CLLocationCoordinate2DMake(-27.477816, 153.006763)];
    [map setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake(-27.477816, 153.006763), MKCoordinateSpanMake(0.01, 0.01))];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)addressClick:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://maps.apple.com/?q=249+Montague+Rd,+West+End,+Brisbane+QLD"]];
}

-(IBAction)email:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:dundee_kim@hotmail.com"]];
}
-(IBAction)call:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:+61488500134"]];
}
- (IBAction)url:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.brisbaneboxinggym.com.au"]];
}
- (IBAction)facebook:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/pages/DUNDEES-Boxing-Fitness/132324633540704?fref=ts"]];
    
}
@end
