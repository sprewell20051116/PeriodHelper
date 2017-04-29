//
//  PHLoginPage.m
//  PeriodHelper
//
//  Created by GIGIGUN on 29/04/2017.
//  Copyright © 2017 GIGIGUN. All rights reserved.
//

#import "PHLoginPage.h"
@import Firebase;
#import <GoogleSignIn/GoogleSignIn.h>

@interface PHLoginPage () <GIDSignInUIDelegate, GIDSignInDelegate>

@end

@implementation PHLoginPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // TODO(developer) Configure the sign-in button look/feel
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    // Uncomment to automatically sign in the user.
    [[GIDSignIn sharedInstance] signInSilently];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




// Implement these methods only if the GIDSignInUIDelegate is not a subclass of
// UIViewController.

// Stop the UIActivityIndicatorView animation that was started when the user
// pressed the Sign In button
- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {
    //    [myActivityIndicator stopAnimating];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

// Present a view that prompts the user to sign in with Google
- (void)signIn:(GIDSignIn *)signIn
presentViewController:(UIViewController *)viewController {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self presentViewController:viewController animated:YES completion:nil];
}

// Dismiss the "Sign in with Google" view
- (void)signIn:(GIDSignIn *)signIn
dismissViewController:(UIViewController *)viewController {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    // Perform any operations on signed in user here.
    NSString *userId = user.userID;                  // For client-side use only!
    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    NSString *fullName = user.profile.name;
    NSString *givenName = user.profile.givenName;
    NSString *familyName = user.profile.familyName;
    NSString *email = user.profile.email;
    // ...
    
    NSLog(@"userID = %@", userId);
    NSLog(@"idToken = %@", idToken);
    NSLog(@"fullName = %@", fullName);
    NSLog(@"givenName = %@", givenName);
    NSLog(@"familyName = %@", familyName);
    NSLog(@"email = %@", email);
}



- (IBAction)SignInBtnClicked:(id)sender {
    [[GIDSignIn sharedInstance] signIn];
}

- (IBAction)SignOutBtnClicked:(id)sender {
    
    [[GIDSignIn sharedInstance] signOut];
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
