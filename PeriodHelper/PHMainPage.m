//
//  PHMainPage.m
//  PeriodHelper
//
//  Created by GIGIGUN on 22/04/2017.
//  Copyright © 2017 GIGIGUN. All rights reserved.
//

#import "PHMainPage.h"
#import "PHuserDataModel.h"
@interface PHMainPage ()

@end

@implementation PHMainPage

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)readDataBtnClicked:(id)sender {
    [[PHuserDataModel getInstance] PHUserReadUserPostDataWithBlock:^(FIRDataSnapshot *snapshot) {
        NSLog(@"%s - snap = %@", __PRETTY_FUNCTION__, snapshot);
    }];
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
