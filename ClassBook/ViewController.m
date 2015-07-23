//
//  ViewController.m
//  ClassBook
//
//  Created by Student on 7/23/15.
//  Copyright (c) 2015 Student_Ralph. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "SVProgressHUD.h"
#import "PeopleTableViewController.h"

@interface ViewController ()
@property (nonatomic, retain) PeopleTableViewController *peopleTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Button Press
-(IBAction)authenticationButtonTapped:(id)sender
{
    LAContext *authContext = [[LAContext alloc] init];
    NSError *error = nil;
    
    if([authContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
    {
        if([authContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
        {
            [authContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                        localizedReason:@"Are you the device owner?"
                                  reply:^(BOOL success, NSError *error)
                                    {
                                        if(error)
                                        {
                                            [SVProgressHUD showErrorWithStatus:@"There was a problem"];
                                            return;
                                        }
                                        
                                        if(success)
                                        {
                                            [SVProgressHUD showSuccessWithStatus:@"You are the owner!"];
                                        }else
                                        {
                                            [SVProgressHUD showErrorWithStatus:@"You are not the owner!"];
                                        }
                                    }
             
             ];
        }
    }else
    {  
        self.peopleTableView = [self.storyboard instantiateViewControllerWithIdentifier:@"People"];
        
        //Switch view controllers
        [UIView beginAnimations:@"View Flip" context:NULL];
        [UIView setAnimationDuration:0.4];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        if(!self.peopleTableView.view.superview)
        {
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
            self.peopleTableView.view.frame = self.view.frame;
            //[self switchViewFromViewController:self. toViewController:self.peopleTableView];
            
           
        }
        [UIView commitAnimations];

    }
}


- (void) switchViewFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if(fromVC != nil)
    {
        [fromVC  willMoveToParentViewController:nil];
        [fromVC.view removeFromSuperview];
        [fromVC removeFromParentViewController];
    }
    
    if(toVC != nil)
    {
        [self addChildViewController:toVC];
        [self.view insertSubview:toVC.view atIndex:0];
        [toVC didMoveToParentViewController:self];
    }
}
@end
