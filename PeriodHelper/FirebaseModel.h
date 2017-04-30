//
//  FirebaseModel.h
//  PeriodHelper
//
//  Created by GIGIGUN on 30/04/2017.
//  Copyright © 2017 GIGIGUN. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Firebase;
@import GoogleSignIn;

@protocol FirebaseGoogleSignInDelegate
@optional
- (void) firebaseGoogleSignIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController;
- (void) firebaseGooglesignIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController;

@end

@interface FirebaseModel : NSObject <GIDSignInUIDelegate> {
    id <FirebaseGoogleSignInDelegate> __weak googleSigninDelegate;
}

@property (weak, nonatomic) id <FirebaseGoogleSignInDelegate> googleSigninDelegate;

+ (instancetype) getInstance;

- (void) firebaseGoogleSignIn;
- (void) firebaseGoogleSignOut;

@end
