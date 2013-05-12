//
//  WebViewController.m
//  Combos
//
//  Created by Rolf Chen on 9/12/12.
//  Copyright (c) 2012 Australian Tourism Data Warehouse. All rights reserved.
//

#import "WebViewController.h"
#import "BoxingTipsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface WebViewController ()

@end

@implementation WebViewController

@synthesize urlString = _urlString;
@synthesize titleString = _titleString;

-(id)initWithHTML:(NSString *)htmlString {
    self = [super initWithNibName:@"WebViewController" bundle:nil];
    if (self) {
        self.urlString = htmlString;
    }
    return self;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [titleLabel setFont:[UIFont fontWithName:@"UniversCondensed" size:32]];
    titleLabel.layer.shadowColor = [[UIColor blackColor] CGColor];
    [self.navigationController setNavigationBarHidden:YES];
    
    titleLabel.text = self.titleString;
    [banner setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BannerBg"]]];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:self.urlString ofType:@"html"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    NSLog(@"URL String: %@ URL: %@", filePath, fileURL);
    [webView loadRequest:[NSURLRequest requestWithURL:fileURL]];
    webView.delegate = self;
    
    //HACK OUT THE SHADOW
    for (UIView *subview in [webView.scrollView subviews]) {
        if ([subview isKindOfClass:[UIImageView class]]) {
            subview.hidden = YES;
        }
    }
    
    if (self.bannerImage != nil) {
        [(UIImageView *)banner setImage:self.bannerImage];
    }
    // Do any additional setup after loading the view from its nib.
    [backButton setHidden:self.backButtonHidden];
    
    self.player = [[MPMoviePlayerController alloc] init];
    [videoView addSubview:self.player.view];
    [self.view addSubview:videoView];
    [videoView bringSubviewToFront:closeButton];
    [videoView setHidden:YES];
}


#pragma mark video player methods 
-(void)playVideo:(NSString *)videoPath{
    [self.player setContentURL:[NSURL fileURLWithPath:videoPath]];
    [self.player setShouldAutoplay:NO];
    [self.player prepareToPlay];
 
    
    [[self.player view] setFrame:videoView.bounds];
    [[self.player view] setCenter:videoView.center];
    [videoView setAlpha:0];
    [videoView setHidden:NO];
    
    [UIView animateWithDuration:0.5 animations:^{
        [videoView setAlpha:1];
        
    } completion:^(BOOL completed) {
        [self.player play];
    }];
}

-(IBAction)stopVideo:(id)sender{
    [self.player pause];
    [UIView animateWithDuration:0.5 animations:^{
        [videoView setAlpha:0];
    } completion:^(BOOL complete){
        [videoView setHidden:YES];
        [self.player stop];
    }];
}

#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"Now loading:%@", [request description]);
    BOOL shouldLoad = YES;
    if ([[[request URL] absoluteString] rangeOfString:@"ui-state=dialog"].location == NSNotFound) {
        [loader startAnimating];
    }
    if ([[request description] rangeOfString:@"dbf:"].location != NSNotFound) {
        NSLog(@"Found!!! %@", [[[request URL] absoluteString] stringByReplacingOccurrencesOfString:@"dbf:" withString:@""]);
       // NSString *viewController = [[[request URL] absoluteString] stringByReplacingOccurrencesOfString:@"dbf:" withString:@""];
       //NEED REVIEW        [Class classForClassName:viewController] alloc
        BoxingTipsViewController *boxingViewController = [[BoxingTipsViewController alloc] initWithNibName:@"BoxingTipsViewController" bundle:nil];
        [self.navigationController pushViewController:boxingViewController animated:YES];
        [loader stopAnimating];
        shouldLoad = NO;
    }
    else if ([[request description] rangeOfString:@"video:"].location != NSNotFound) {
        NSString *videoFileName = [[[request URL] absoluteString] stringByReplacingOccurrencesOfString:@"video:" withString:@""];
        NSString *videoPath = [[NSBundle mainBundle] pathForResource:videoFileName ofType:@"mp4" inDirectory:@"video"];
        NSLog(@"Path: %@", videoPath);
         
        [self playVideo:videoPath];
        [loader stopAnimating];
        shouldLoad = NO;
    }
    else if ([[request description] rangeOfString:@"#"].location != NSNotFound) {
        [loader stopAnimating];

    }
    return shouldLoad;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [loader stopAnimating];
    NSLog(@"Loaded");
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Load Error");
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    [UIView animateWithDuration:0.5 animations:^{
        [videoView setFrame:self.view.bounds];
        [[self.player view] setFrame:videoView.bounds];
    }];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.player pause];
}

@end
