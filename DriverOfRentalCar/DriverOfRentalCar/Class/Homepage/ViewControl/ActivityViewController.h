//
//  ActivityViewController.h
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityViewController : UIViewController
{
    IBOutlet UIButton *_activityBtn;
    IBOutlet UILabel *_driverInfoLab;
}

- (IBAction)Activity:(id)sender;

@end
