//
//  PHuserDataModel.h
//  PeriodHelper
//
//  Created by GIGIGUN on 01/05/2017.
//  Copyright © 2017 GIGIGUN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PHuserDataModel : NSObject
+ (instancetype) getInstance;
- (void) PHUserInitUserData;
- (void) PHUserUpdateData;
- (void) PHUserReadeData;
- (void) PHUserReadUserPostDataWithBlock:(void (^)(FIRDataSnapshot *snapshot)) block;

@end
