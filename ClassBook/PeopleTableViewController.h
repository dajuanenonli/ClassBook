//
//  PeopleTableViewController.h
//  ClassBook
//
//  Created by Student on 7/23/15.
//  Copyright (c) 2015 Student_Ralph. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonDetailViewController.h"

@interface PeopleTableViewController : UITableViewController
@property (strong, nonatomic) PersonDetailViewController *detailViewController;
@end
