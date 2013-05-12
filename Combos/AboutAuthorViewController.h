//
//  AboutAuthorViewController.h
//  Combos
//
//  Created by Rolf Chen on 20/01/13.
//  Copyright (c) 2013 Australian Tourism Data Warehouse. All rights reserved.
//

#import "BaseViewController.h"

@interface AboutAuthorViewController : BaseViewController <UIWebViewDelegate> {
    IBOutlet UILabel *bannerTitle;
    IBOutlet UIWebView *contentWebView;
    IBOutlet UIActivityIndicatorView *loader;
}

@end
