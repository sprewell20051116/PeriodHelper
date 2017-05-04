//
//  PHAccountPage.m
//  PeriodHelper
//
//  Created by GIGIGUN on 01/05/2017.
//  Copyright © 2017 GIGIGUN. All rights reserved.
//

#import "PHAccountPage.h"
#import "PHuserDataModel.h"
#import <UIImageView+AFNetworking.h>

@interface PHAccountPage () <GIDSignInUIDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *userImageView;

@end

@implementation PHAccountPage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_userImageView setImageWithURL:[[PHuserDataModel getInstance] PHUserGetUserPhotoURL] placeholderImage:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)singOutBtnClicked:(id)sender {
//    [[GIDSignIn sharedInstance] disconnect];
    [[FirebaseModel getInstance] firebaseGoogleSignOut];
    
}
- (IBAction)doneBtnClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
