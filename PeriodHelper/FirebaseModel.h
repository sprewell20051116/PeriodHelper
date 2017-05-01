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

@protocol FirebaseGoogleSignInUIDelegate
@optional
- (void) firebaseGoogleSignIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController;
- (void) firebaseGooglesignIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController;

@end

@interface FirebaseModel : NSObject <GIDSignInUIDelegate> {
    id <FirebaseGoogleSignInUIDelegate> __weak googleSigninUIDelegate;
}

@property (weak, nonatomic) id <FirebaseGoogleSignInUIDelegate> googleSigninUIDelegate;

+ (instancetype) getInstance;
- (void) firebaseGoogleSignIn;
- (void) firebaseGoogleSignOut;


@property (strong, nonatomic) FIRDatabaseReference *ref;
- (void) firebaseInitUserData;
- (void) firebaseUpdateDataWithDic : (NSDictionary *) dic;
- (void) firebaseReadDataOnce;
- (void) firebaseReadUserPostDataWithBlock:(void (^)(FIRDataSnapshot *snapshot)) block;


@end
