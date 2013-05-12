//
//  AboutAuthorViewController.m
//  Combos
//
//  Created by Rolf Chen on 20/01/13.
//  Copyright (c) 2013 Australian Tourism Data Warehouse. All rights reserved.
//

#import "AboutAuthorViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AboutAuthorViewController ()

@end

@implementation AboutAuthorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    contentWebView.delegate = self;
    [bannerTitle setFont:[UIFont fontWithName:@"UniversCondensed" size:32]];
    bannerTitle.layer.shadowColor = [[UIColor blackColor] CGColor];

    [banner setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BannerBg"]]];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"about" ofType:@"html"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    NSLog(@"URL String: %@ URL: %@", filePath, fileURL);
    [contentWebView loadRequest:[NSURLRequest requestWithURL:fileURL]];
    
    //HACK OUT THE SHADOW
    for (UIView *subview in [contentWebView.scrollView subviews]) {
        if ([subview isKindOfClass:[UIImageView class]]) {
            subview.hidden = YES;
        }
    }
   
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
