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

- (void) firebaseInitUserData
{
    [[[_ref child:@"users"] child:[FIRAuth auth].currentUser.uid] setValue:@{@"username": [FIRAuth auth].currentUser.displayName} withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
        NSLog(@"%s complete", __PRETTY_FUNCTION__);
    }];
}


- (void) firebaseUpdateDataWithDic : (NSDictionary *) dic
{
    NSString *key = [[_ref child:@"posts"] childByAutoId].key;
    NSDictionary *post = dic;
    NSDictionary *childUpdates = @{[NSString stringWithFormat:@"/user-posts/%@/%@/", [[FIRAuth auth] currentUser].uid, key]: post};
    
    
    [_ref updateChildValues:childUpdates];
    [_ref updateChildValues:childUpdates withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
        NSLog(@"%s complete", __PRETTY_FUNCTION__);
    }];
    
    
}

- (void) firebaseReadDataOnce
{
    NSString *userID = [FIRAuth auth].currentUser.uid;
    [[[_ref child:@"users"] child:userID] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        // Get user value
        NSLog(@"data snapshot = %@", snapshot.value[@"username"]);
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}


#pragma mark -
#pragma mark Private Functions
-(instancetype) initUniqueInstance {
    if (self = [super init]) {
        
        [GIDSignIn sharedInstance].uiDelegate = self;
        [[GIDSignIn sharedInstance] signInSilently];
        self.ref = [[FIRDatabase database] reference];


    }
    return self;
}


@end
