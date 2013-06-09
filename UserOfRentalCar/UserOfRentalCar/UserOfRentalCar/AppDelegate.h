//
//  AppDelegate.h
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-2.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h" //百度地图的头文件

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,BMKGeneralDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (nonatomic,retain) UINavigationController *myLocationNav;
@property (nonatomic,retain) UINavigationController *carModel;
@property (nonatomic,retain) UINavigationController *carPrice;
@property (nonatomic,retain) UINavigationController *myOrderNav;
@end
