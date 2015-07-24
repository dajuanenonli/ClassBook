//
//  PersonDetailViewController.m
//  ClassBook
//
//  Created by Student on 7/23/15.
//  Copyright (c) 2015 Student_Ralph. All rights reserved.
//

#import "PersonDetailViewController.h"

@interface PersonDetailViewController()

@property(nonatomic, weak) IBOutlet UILabel *firstNameLabel;
@property(nonatomic, weak) IBOutlet UILabel *lastNameLabel;
@property(nonatomic, weak) IBOutlet UILabel *addressLabel;
@property(nonatomic, weak) IBOutlet UILabel *cityLabel;
@property(nonatomic, weak) IBOutlet UILabel *stateLabel;
@property(nonatomic, weak) IBOutlet UILabel *zipCodeLabel;
@property(nonatomic, weak) IBOutlet UILabel *mobileLabel;

@end

@implementation PersonDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.firstNameLabel.text = self.selectedperson.firstName;
    self.lastNameLabel.text = self.selectedperson.lastName;
    self.addressLabel.text = self.selectedperson.address;
    self.cityLabel.text = self.selectedperson.city;
    self.stateLabel.text = self.selectedperson.state;
    self.zipCodeLabel.text = self.selectedperson.zip;
    self.mobileLabel.text = self.selectedperson.mobile;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
