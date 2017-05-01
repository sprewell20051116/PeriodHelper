//
//  PHuserDataModel.m
//  PeriodHelper
//
//  Created by GIGIGUN on 01/05/2017.
//  Copyright © 2017 GIGIGUN. All rights reserved.
//

#import "PHuserDataModel.h"
#import "FirebaseModel.h"

@interface PHuserDataModel()
@property (strong, nonatomic) FirebaseModel *firebaseObj;

@end

@implementation PHuserDataModel

+ (instancetype) getInstance {
    
    static dispatch_once_t once;
    static PHuserDataModel *instance;
    dispatch_once(&once, ^{
        instance = [[PHuserDataModel alloc] initUniqueInstance];
    });
    
    return instance;
}

-(void) firebaseDataUpdateData
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYYMMdd-HHmmss"];
    NSString *dateString = [formatter stringFromDate:[NSDate date]];

    NSDictionary *userDic = @{@"userName" : @"test",
                              @"date" : dateString
                              };
    [_firebaseObj firebaseUpdateDataWithDic:userDic];
    
}

-(void) firebaseDataReadeData
{
    [_firebaseObj firebaseReadDataOnce];
}

- (void) firebaseDataInitUserData
{
    [_firebaseObj firebaseInitUserData];
}



#pragma mark -
#pragma mark Private Functions
-(instancetype) initUniqueInstance {
    if (self = [super init]) {
        
        _firebaseObj = [FirebaseModel getInstance];
        
    }
    return self;
}

@end
