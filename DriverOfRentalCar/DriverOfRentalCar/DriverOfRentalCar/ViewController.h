//
//  ViewController.h
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AllOrderViewController.h"
#import "MyLocationViewController.h"
#import "MyStatusViewController.h"
#import "LoginViewController.h"
#import "ActivityViewController.h"

@interface ViewController : UIViewController{
    AppDelegate *appDelegate;

}

@property (nonatomic,retain) LoginViewController *loginView;
@property (nonatomic,retain) ActivityViewController *activityView;
@property (nonatomic,retain) MyStatusViewController *myStatusView;
@property (nonatomic,retain) MyLocationViewController *myLocationView;
@property (nonatomic,retain) AllOrderViewController *allOrderView;
@property (nonatomic,retain) IBOutlet UIButton *homePageButton;
@property (nonatomic,retain) IBOutlet UIButton *myStatusButton;
@property (nonatomic,retain) IBOutlet UIButton *myLocationButton;
@property (nonatomic,retain) IBOutlet UIButton *myOrderButton;
- (IBAction)homePageAction;
- (IBAction)myStatusAction;
- (IBAction)myOrderAction;
- (IBAction)myLocationAction;
+ (ViewController *)viewCtl;
@end
