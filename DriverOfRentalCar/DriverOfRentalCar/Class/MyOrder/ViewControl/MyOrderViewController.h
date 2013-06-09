//
//  MyOrderViewController.h
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrderViewController : UIViewController
@property(nonatomic,retain) IBOutlet UILabel *orderTime;
@property(nonatomic,retain) IBOutlet UILabel *orderStatus;
@property(nonatomic,retain) IBOutlet UILabel *orderCar;
@property(nonatomic,retain) IBOutlet UILabel *orderPrice;
@property(nonatomic,retain) IBOutlet UILabel *orderStartTime;
@property(nonatomic,retain) IBOutlet UILabel *orderEndTime;
@property(nonatomic,retain) IBOutlet UILabel *orderStartPlace;
@property(nonatomic,retain) IBOutlet UILabel *orderEndPlace;
@property(nonatomic,retain) IBOutlet UILabel *orderMobileNO;
@property(nonatomic,retain) IBOutlet UIButton *submitOrderBtn;
@property(nonatomic,retain) IBOutlet UIButton *allOrderBtn;
@property(nonatomic,retain) IBOutlet UIImageView *bgImage;

- (IBAction)Submit:(id)sender;
- (IBAction)AllOrder:(id)sender;

@end
