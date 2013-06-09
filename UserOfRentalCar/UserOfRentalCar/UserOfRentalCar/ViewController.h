//
//  ViewController.h
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-2.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MyLocationViewController.h"
#import "AllOrderViewController.h"
#import "NearCarViewController.h"
#import "PriceOfCarViewController.h"
#import "BMapKit.h"

@interface ViewController : UIViewController<BMKMapViewDelegate>
{
    AppDelegate *appDelegate;
    BMKMapView* _mapView;

}

@property (nonatomic,retain) MyLocationViewController *myLocationView;
@property (nonatomic,retain) NearCarViewController *nearCarView;
@property (nonatomic,retain) PriceOfCarViewController *priceOfCarView;
@property (nonatomic,retain) AllOrderViewController *allOrderView;
@property (nonatomic,retain) IBOutlet UIButton *myLocationBtn;
@property (nonatomic,retain) IBOutlet UIButton *nearCarBtn;
@property (nonatomic,retain) IBOutlet UIButton *priceOfCarBtn;
@property (nonatomic,retain) IBOutlet UIButton *myOrderBtn;


- (IBAction)myLocationAction;
- (IBAction)nearCarAction;
- (IBAction)priceOfCarAction;
- (IBAction)myOrderAction;
@end
