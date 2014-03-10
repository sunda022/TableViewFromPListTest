//
//  MainViewController.m
//  TableViewFromPListTest
//
//  Created by Chuck Preston on 3/7/14.
//  Copyright (c) 2014 Nerdery. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property NSDictionary *courseDataDictionary;
@property NSArray *justCourseNamesArray;

@end

@implementation MainViewController

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
	// Do any additional setup after loading the view.
    
    // get the path to the plist
    NSURL *coursesPlistUrl = [[NSBundle mainBundle] URLForResource:@"courses" withExtension:@"plist"];
    // create the dictionary with the data from the plist
    self.courseDataDictionary = [NSDictionary dictionaryWithContentsOfURL:coursesPlistUrl];
    // create the array with just the keys from the dictionary
    self.justCourseNamesArray = [self.courseDataDictionary allKeys];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.justCourseNamesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"myCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = self.justCourseNamesArray[indexPath.row];
    
    return cell;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
