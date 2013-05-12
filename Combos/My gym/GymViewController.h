//
//  GymViewController.h
//  Combos
//
//  Created by Rolf Chen on 24/03/12.
//  Copyright (c) 2012 Australian Tourism Data Warehouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <MapKit/MapKit.h>

@interface GymViewController : BaseViewController {
    IBOutlet UILabel *titleLabel;
    
    IBOutlet UIView *contentView;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UILabel *lblAddress;
    IBOutlet UIButton *btnAddress;
    IBOutlet UILabel *lblEmail;
    IBOutlet UIButton *btnEmail;
    IBOutlet UILabel *lblMobile;
    IBOutlet UIButton *btnMobile;
    IBOutlet UIButton *btnFacebook;
    IBOutlet UILabel *lblOpenHour;
    IBOutlet MKMapView *map;
    IBOutlet UILabel *lblWebsite;
    IBOutlet UIButton *btnWebsite;
    IBOutlet UILabel *lblGym;
}

- (IBAction)addressClick:(id)sender;

-(IBAction)email:(id)sender;
-(IBAction)call:(id)sender;
- (IBAction)url:(id)sender;
- (IBAction)facebook:(id)sender;


@end
