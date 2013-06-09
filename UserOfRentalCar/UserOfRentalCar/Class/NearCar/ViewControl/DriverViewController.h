//
//  DriverViewController.h
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-2.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DriverViewController : UIViewController
{
    IBOutlet UIView *_myView;
    IBOutlet UIScrollView *_myScroll;
    IBOutlet UIImageView *_titleBgImg;
    IBOutlet UIImageView *_titleImg;
    IBOutlet UIImageView *_contentBgImg;
    IBOutlet UIImageView *_evaluateBgImg;
    IBOutlet UILabel *_driverName;
    IBOutlet UILabel *_driverCar;
    IBOutlet UILabel *_driverPhone;



}

- (IBAction)GoBack:(id)sender;
- (IBAction)RentCar:(id)sender;
@end
