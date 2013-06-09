//
//  OrderCell.h
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCell : UITableViewCell
@property(nonatomic,retain) IBOutlet UILabel *orderTime;
@property(nonatomic,retain) IBOutlet UILabel *orderStatus;
@property(nonatomic,retain) IBOutlet UILabel *orderCar;
@property(nonatomic,retain) IBOutlet UILabel *orderPrice;
@property(nonatomic,retain) IBOutlet UILabel *orderStartTime;
@property(nonatomic,retain) IBOutlet UILabel *orderEndTime;
@property(nonatomic,retain) IBOutlet UILabel *orderStartPlace;
@property(nonatomic,retain) IBOutlet UILabel *orderEndPlace;
@property(nonatomic,retain) IBOutlet UILabel *orderMobileNO;
@property(nonatomic,retain) IBOutlet UIButton *payForBtn;
@property(nonatomic,retain) IBOutlet UIButton *evaluateBtn;
@property(nonatomic,retain) IBOutlet UIImageView *bgimage;;

@end
