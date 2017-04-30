//
//  PHLoginPage.m
//  PeriodHelper
//
//  Created by GIGIGUN on 29/04/2017.
//  Copyright © 2017 GIGIGUN. All rights reserved.
//

#import "PHLoginPage.h"
#import "FirebaseModel.h"


@interface PHLoginPage () <FirebaseGoogleSignInDelegate>

@end

@implementation PHLoginPage

- (void)viewDidLoad {
    [super viewDidLoad];
    [FirebaseModel getInstance].googleSigninDelegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {
    //    [myActivityIndicator stopAnimating];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

// Present a view that prompts the user to sign in with Google
- (void)signIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self presentViewController:viewController animated:YES completion:nil];
}

// Dismiss the "Sign in with Google" view
- (void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) firebaseGoogleSignIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController
{
    [self presentViewController:viewController animated:YES completion:nil];

}
- (void) firebaseGooglesignIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)SignInBtnClicked:(id)sender {
    [[FirebaseModel getInstance] firebaseGoogleSignIn];
}

- (IBAction)SignOutBtnClicked:(id)sender {
    
    [[FirebaseModel getInstance] firebaseGoogleSignOut];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
