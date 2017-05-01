//
//  FirebaseModel.m
//  PeriodHelper
//
//  Created by GIGIGUN on 30/04/2017.
//  Copyright © 2017 GIGIGUN. All rights reserved.
//

#import "FirebaseModel.h"

@implementation FirebaseModel
@synthesize googleSigninUIDelegate;

+ (instancetype) getInstance {
    
    static dispatch_once_t once;
    static FirebaseModel *instance;
    dispatch_once(&once, ^{
        instance = [[FirebaseModel alloc] initUniqueInstance];
    });
    
    return instance;
}

- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {
    //    [myActivityIndicator stopAnimating];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

// Present a view that prompts the user to sign in with Google
- (void)signIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [googleSigninUIDelegate firebaseGoogleSignIn:signIn presentViewController:viewController];

//    [self presentViewController:viewController animated:YES completion:nil];
}

// Dismiss the "Sign in with Google" view
- (void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [googleSigninUIDelegate firebaseGooglesignIn:signIn dismissViewController:viewController];
}

- (void) firebaseGoogleSignIn
{
    [[GIDSignIn sharedInstance] signIn];
}

- (void) firebaseGoogleSignOut
{
    [[GIDSignIn sharedInstance] signOut];
    NSError *error;
    [[FIRAuth auth] signOut:&error];
    NSLog(@"error = %@", error);
}

#pragma mark -
#pragma mark Private Functions
-(instancetype) initUniqueInstance {
    if (self = [super init]) {
        
        [GIDSignIn sharedInstance].uiDelegate = self;
        [[GIDSignIn sharedInstance] signInSilently];

    }
    return self;
}


@end
