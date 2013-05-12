//
//  BoxingTipsViewController.h
//  Combos
//
//  Created by Rolf Chen on 9/12/12.
//  Copyright (c) 2012 Australian Tourism Data Warehouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface BoxingTipsViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITableView *tipsTable;
    NSArray *tableSource;
    IBOutlet UILabel *titleLabel;
}


@end
