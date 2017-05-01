//
//  baseViewController.m
//  PeriodHelper
//
//  Created by GIGIGUN on 29/04/2017.
//  Copyright © 2017 GIGIGUN. All rights reserved.
//

#import "baseViewController.h"


@interface baseViewController ()

@end

@implementation baseViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) presentLoginPage {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    UIViewController *loginPage = [mainStoryboard instantiateViewControllerWithIdentifier: LOGIN_PAGE_ID];
    [self presentViewController:loginPage animated:NO completion:nil];
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
