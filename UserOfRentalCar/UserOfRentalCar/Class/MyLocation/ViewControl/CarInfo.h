//
//  CarInfo.h
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-24.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarInfo : NSObject
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *classify;
@property (nonatomic, retain) NSString *longitude;
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *driver;
@property (nonatomic, assign) NSInteger star;
@end
