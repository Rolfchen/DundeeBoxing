//
//  WebViewController.h
//  Combos
//
//  Created by Rolf Chen on 9/12/12.
//  Copyright (c) 2012 Australian Tourism Data Warehouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "BaseViewController.h"

@interface WebViewController : BaseViewController <UIWebViewDelegate>{
    IBOutlet UIWebView *webView;
    IBOutlet UILabel *titleLabel;
    IBOutlet UIActivityIndicatorView *loader;
    
    IBOutlet UIButton *closeButton;
    IBOutlet UITextView *videoCaption;
    
    IBOutlet UIView *videoView;
}

@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) UIImage *bannerImage;
@property (nonatomic, strong) MPMoviePlayerController *player;
@property (nonatomic) BOOL backButtonHidden;

-(id)initWithHTML:(NSString *)htmlString;
-(IBAction)stopVideo:(id)sender;


@end
