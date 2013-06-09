//
//  CarInfoCell.h
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-31.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarInfoCell : UITableViewCell
@property (nonatomic,retain) IBOutlet UILabel *carName;
@property (nonatomic,retain) IBOutlet UIImageView *carImg;
@property (nonatomic,retain) IBOutlet UILabel *carAddress;
@property (nonatomic,retain) IBOutlet UILabel *carStar;
@property (nonatomic,retain) IBOutlet UILabel *carLong;
@property (nonatomic,retain) IBOutlet UILabel *carClass;


@end
