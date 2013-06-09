//
//  AppDelegate.h
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (nonatomic,retain) UINavigationController *homePageNav;
@property (nonatomic,retain) UINavigationController *myStatusNav;
@property (nonatomic,retain) UINavigationController *myLocationNav;
@property (nonatomic,retain) UINavigationController *myOrderNav;
@end
