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

@interface ViewController ()

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
       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Your device cannot authenticate using TouchId."
                                                       delegate:nil
                                              cancelButtonTitle:@"LOL!"
                                              otherButtonTitles:nil];
        [alert show];
        /* [SVProgressHUD showErrorWithStatus:@"Your device cannot authenticate using TouchId."];*/
    }
}
@end
