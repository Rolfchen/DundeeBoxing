//
//  BoxingTipsViewController.m
//  Combos
//
//  Created by Rolf Chen on 9/12/12.
//  Copyright (c) 2012 Australian Tourism Data Warehouse. All rights reserved.
//

#import "BoxingTipsViewController.h"
#import "WebViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BoxingTipsViewController ()

@end

@implementation BoxingTipsViewController

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
    [titleLabel setFont:[UIFont fontWithName:@"UniversCondensed" size:36]];
    titleLabel.layer.shadowColor = [[UIColor blackColor] CGColor];
    
    
    [banner setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BannerBg"]]];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:YES];
    
    //BUILD TABLE SOURCE HERE
    NSMutableArray *sourceBuilder = [[NSMutableArray alloc] init];
    
    NSMutableArray *mainSource = [@[] mutableCopy];
   
    [sourceBuilder addObject:@{@"title": @"Equipment Guide", @"link": @"equipments"}];
    [sourceBuilder addObject:@{@"title": @"Warm Ups and Cool Downs", @"link": @"stretching"}];
    [sourceBuilder addObject:@{@"title": @"Strength Moves", @"link": @"exercises"}];
    [sourceBuilder addObject:@{@"title": @"Cardiovascular Training", @"link": @"cardio"}];
    [sourceBuilder addObject:@{@"title": @"Plyometric Drills", @"link": @"plyometric"}];
    [sourceBuilder addObject:@{@"title": @"Strength and Speed Training", @"link": @"strength"}];
    [sourceBuilder addObject:@{@"title": @"Weight Training", @"link": @"weighttraining"}];
    
    [mainSource addObject:@{@"name": @"Getting Started", @"item": [sourceBuilder copy]}];
    
     [sourceBuilder removeAllObjects];
    [sourceBuilder addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Stances", @"title", @"stances", @"link", nil]];
    [sourceBuilder addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Foot Works", @"title", @"footwork", @"link", nil]];
    [sourceBuilder addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Circling", @"title", @"circling", @"link", nil]];
    [sourceBuilder addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Rhythm and Style", @"title", @"rhythm", @"link", nil]];
    [sourceBuilder addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Hand Wraps", @"title", @"handwrap", @"link", nil]];
    

    [mainSource addObject:@{@"name": @"Basics", @"item":[sourceBuilder copy]}];
        
    [sourceBuilder removeAllObjects];
    [sourceBuilder addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Ducking", @"title", @"ducking", @"link", nil]];
    [sourceBuilder addObject:@{@"title": @"Catch", @"link": @"catch"}];
    [sourceBuilder addObject:@{@"title": @"Parrying", @"link": @"parrying"}];
    [sourceBuilder addObject:@{@"title": @"Step Back Pull", @"link": @"pull"}];
    [sourceBuilder addObject:@{@"title": @"Wall", @"link": @"wall"}];
    [sourceBuilder addObject:@{@"title": @"Slip and Dip", @"link": @"slip"}];
    [sourceBuilder addObject:@{@"title": @"Elbow Block", @"link": @"block"}];
    
    [mainSource addObject:@{@"name": @"Defensive Positions", @"item": [sourceBuilder copy]}];
    
    [sourceBuilder removeAllObjects];
    [sourceBuilder addObject:@{@"title": @"Jab", @"link": @"jab"}];
    [sourceBuilder addObject:@{@"title": @"Straight", @"link": @"straight"}];
    [sourceBuilder addObject:@{@"title": @"Hook", @"link": @"hook"}];
    
    [mainSource addObject:@{@"name": @"Offensive Punches", @"item": [sourceBuilder copy]}];
    
    
    
    tableSource = [NSArray arrayWithArray:mainSource];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WebViewController *tips = [[WebViewController alloc] initWithHTML:tableSource[indexPath.section][@"item"][indexPath.row][@"link"]];
    tips.bannerImage = [UIImage imageNamed:@"FitnessBanner.png"];
    tips.titleString = tableSource[indexPath.section][@"item"][indexPath.row][@"title"];
    [self.navigationController pushViewController:tips animated:YES];
   /* NSDictionary *comboList = [tableSource objectAtIndex:indexPath.section];
    NSDictionary *comboDetail = [[comboList objectForKey:@"Combos"] objectAtIndex:indexPath.row];
    */
   // ComboDetailViewController *comboDetailView = [[ComboDetailViewController alloc] initWithComboDetail:comboDetail];
   // [self.navigationController pushViewController:comboDetailView animated:YES];
}
#pragma mark UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    /*if (tableSource != nil) {
        return [tableSource count];
    }
    else {
        return 1;
    }*/
    
    return [tableSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   /* if (tableSource != nil) {
        return [[[tableSource objectAtIndex:section] objectForKey:@"Combos"] count];
    }
    else {
        return 1;
    }*/
    return [tableSource [section][@"item"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"tipsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (tableSource != nil) {
        NSDictionary *moveList = [tableSource objectAtIndex:indexPath.section];
        
        cell.textLabel.text = [[[moveList objectForKey:@"item"] objectAtIndex:indexPath.row] objectForKey:@"title"];
        
    }
    else {
        cell.textLabel.text = @"";
    }
    
    
  //  cell.textLabel.text = [[tableSource objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableSource != nil) {
        return [[tableSource objectAtIndex:section] objectForKey:@"name"];
    }
    else {
        return @"";
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 22)];
    [headingView setBackgroundColor:[UIColor colorWithRed:254.0f/255.0f green:197.0f/255.0f blue:64.0f/255.0f alpha:1]];
    
    UILabel *headingLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, tableView.frame.size.width - 10, 22)];
    [headingLabel setBackgroundColor:[UIColor clearColor]];
    if (tableSource != nil) {
        [headingLabel setText:[[tableSource objectAtIndex:section] objectForKey:@"name"]];
    }
    else {
        [headingLabel setText:@""];
    }
    [headingView addSubview:headingLabel];
    [headingLabel setFont:[UIFont fontWithName:@"UniversCondensed" size:20]];
    [headingLabel setTextColor:[UIColor whiteColor]];
    return headingView;
}

@end
