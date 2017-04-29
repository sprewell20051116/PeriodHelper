//
//  AppDelegate.h
//  PeriodHelper
//
//  Created by GIGIGUN on 22/04/2017.
//  Copyright © 2017 GIGIGUN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@import Firebase;
@import GoogleSignIn;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

